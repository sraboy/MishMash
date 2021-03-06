#!/bin/bash


# This function will dig through systemd's unit files to find all the
# various services that may start at boot.
autostarts=()
getautostarts() {
    # Get all the unit files for systemd's services.
    # We exclude "masked" since those services are prevented from starting
    # both automatically and manually. Services that are "disabled" can
    # be started manually (maybe by some other script somewhere), so we
    # include them. You could change "masked" to "disabled" if you were
    # only concerned with what systemd was configured to start on its
    # own; you don't actually have to exclude "masked" here (since those
    # files are empty anyway) but I left it in to make it a simple
    # cut/paste to change to "disabled" when that's what I need.
    MSG="Collecting systemd unit files..."
    echo "$MSG"

    # We declare first so we keep the array local
    declare -a unitfiles
    read -ra unitfiles <<< $(systemctl list-unit-files --type=service |
                   grep -v masked | head -n-2 | awk 'NR>1{print $1}')

    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"

    MSG="Checking paths..."
    echo "$MSG"
    local paths=()
    for f in "${unitfiles[@]}"; do
        echo -en "\r\033[KLooking for $f"
        # We have to search for user-mode and system-mode unit files
        # separately because each mode has a different set of directories
        # to search and each mode searches those directories in a
        # specific order. We only take the first unit file found because
        # we're searching the directories in the same order of precedence
        # systemd does. The first unit file found is the only one that
        # is executed. See `man 7 file-hierarchy`.

        # First, we'll search for a user-mode unit file.
        paths+=($(find $XDG_CONFIG_HOME/systemd/user    \
                       /root/.config/systemd/user       \
                       /home/*/.config/systemd/user     \
                       /etc/systemd/user                \
                       $XDG_RUNTIME_DIR/systemd/user    \
                       /run/systemd/user                \
                       $XDG_DATA_HOME/systemd/user      \
                       $HOME/.local/share/systemd/user  \
                       /usr/lib/systemd/user            \
                       -type f -name $f -print -quit 2>/dev/null))

        # Next, a system-mode unit file. We also search the /lib path
        # since that will include the defaults provided by the package,
        # though it may simply link to /usr/lib.
        paths+=($(find /etc/systemd/system/     \
                       /run/systemd/system/     \
                       /usr/lib/systemd/system/ \
                       /lib/systemd/system/     \
                       -type f -name $f -print -quit 2>/dev/null))
    done
    echo -e "\r\033[1A\033[K$MSG Found ${#paths[@]} unit files. Done!" && echo -en "\033[K"

    local execfiles=()
    MSG="Parsing configurations..."
    echo "$MSG"
    for path in "${paths[@]}"; do
        echo -en "\r\033[KProcessing $path..."
        # We look at the content of every unit file and look for the
        # ExecStart, ExecStartPre and ExecStartPost config options,
        # excluding comments via grep. We use sed to extract the binary
        # name, sans arguments, and then, if it happens to be a link,
        # we get the target. Last, remove duplicates since a lot of the
        # services just pass different options to a binary for Start/Stop.
        bins=( $(cat $path | grep -e "^ExecStart" | 
                sed 's/\(ExecStart\|ExecStartPre\|ExecStartPost\)=-*\([^ ]\+\) \([^\-c].*\)/\2\n\3/') )
        # Save the binary
        execfiles+=($(readlink -f "${bins[0]}"))
        # If it's a non-inline script, save the script too
        if [[ " ${bins[0]} " == *"python"* || " ${bins[0]} " == *"perl"* && -e "${bins[1]}" ]]; then
            execfiles+=($(readlink -f "${bins[1]}"))
        fi
    done
    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"

    # Get all the paths that `ld` would check for the libraries
    # the executables may import.
    MSG="Getting library search paths..."
    echo "$MSG"
    declare -a ldpaths
    read -ra ldpaths <<< $(ldconfig -v 2>/dev/null | grep -v ^$'\t')

    # Get rid of the trailing colon.
    for ((i=0; i<${#ldpaths[@]}; i++)); do
        ldpaths[$i]="${ldpaths[$i]::-1}"
    done
    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"

    # Now we iterate through all the executables launched by systemd
    # and check their dependencies. What tools are available will
    # dictate the best way to do this. Using `ldd` is the best
    # route since it will also find dependencies of dependencies but it 
    # wasn't available on my test system.
    #
    # ldd /bin/ls | awk '{print $1}'
    # readelf -d /bin/ls | grep NEEDED | awk '{print $5}' | sed 's/\[\|\]//g'
    # objdump -p /bin/ls | grep NEEDED | awk '{print $2}'
    MSG="Checking for ELF dependencies..."
    echo "$MSG"
    
    for ef in "${execfiles[@]}"; do
        echo -en "\r\033[KChecking $ef"
        # Save the binary itself
        [[ -e "$ef" ]] && autostarts+=("$ef")

        mapfile -t libs < <(objdump -p "$ef" 2>/dev/null | grep NEEDED | awk '{print $2}')
        
        # Find and save the full path of each dependency
        for lib in "${libs[@]}"; do
            for prefix in "${ldpaths[@]}"; do
                if [ -e "$prefix/$lib" ]; then
                    autostarts+=( $(readlink -f "$prefix/$lib") )
                fi
            done
        done
    done
    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"
    autostarts=($(printf "%s\n" "${autostarts[@]}" | sort -u))
    printf "Identified ${#autostarts[@]} auto-starting executables\\dependencies\n"
}

checkmissed() {
    MSG="Checking for missed files..."
    echo "$MSG"
    missed=0
    for f in "${autostarts[@]}"; do
        if [[ ! " ${files[*]} " == *"$f"* ]]; then
            echo -en "\r\033[KAdding: $f"
            files+=("$f")
            missed=$((missed+1))
        fi
    done
    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"
    echo "Added $missed missed files"
}

main() {
    if [ "$EUID" -ne 0 ]; then
        (>&2 echo "Please run as root!")
        exit
    fi

    getautostarts

    rootloc="/"
    
    # Note that the second find command below dramatically extends the
    # script's runtime. All it's doing is finding ELFs that happen to
    # not be marked executable since the first find command misses
    # those. My actual target system was a small embedded installation
    # so this only went from ~3min to ~8min. My development system,
    # however, went from ~12min to ~31min. Here's the quicker version:
    # 
    #   mapfile -t files < <(find $rootloc -executable -type f -not -path "/mnt/*" -not -path "/media/*" 2>/dev/null)
    # NOTES:
    # - Use `-perm /111` if you don't have `-executable`
    # - Various versions of the second find command were tested to 
    #   identify which has the fastest throughput. It doesn't appear to 
    #   get any better than this.

    MSG="Finding all executables & ELFs in $rootloc..."
    echo "$MSG"
    mapfile -t files < <(find $rootloc -executable -type f -not -path "/mnt/*" -not -path "/media/*" 2>/dev/null &
                         find $rootloc -not -executable -type f -not -path "/mnt/*" -not -path "/media/*" 2>/dev/null -print0 | xargs -0 file {} | sed -n '/ELF/p' | sed 's/:.*//g' & wait)

    # The shorter `find` will miss non-executable ELFs, so we'll add them
    # to our list with this. Similarly, even with the longer `find`, 
    # we'll miss non-executable Python scripts.
    checkmissed
    
    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"
    echo "Found ${#files[@]} files"

    elf32="ELF 32-bit"
    elf64="ELF 64-bit"
    elfcount=0
    socketcount=0
    suidrootcount=0
    autostartcount=0
    table=()
    MSG="Checking executables..."
    echo "$MSG"
    # Now we'll iterate and get `file` output for each executable and
    # also find all ELFs which import the functions we're interested in.
    # You should manually check a few files with `objdump -T` to see
    # exactly what the output looks like so you can `grep` properly.
    for ((i=0; i<${#files[@]}; i++)); do
            echo -en "\r\033[KChecking file $((i+1))/${#files[@]}: '${files[$i]}'"

            # We add the output of `file` to our table so we know what
            # we're looking at. However, `file` outputs:
            # "filename: <stuff>". We don't want that space so we use -b
            # to skip outputting the filename and do that ourselves.
            table[$i]="\"${files[$i]}\",\"$(file -b "${files[$i]}")\","
            
            # We check for both 32- and 64-bit ELF files since a 64-bit
            # machine can run 32-bit ELFs. Technically, this will produce
            # false-positives if a file is named "ELF (32|64)-bit."
            if [[ "${table[$i]}" == *"$elf32"* ]] || [[ "${table[$i]}" == *"$elf64"* ]]; then
                elfcount=$((elfcount+1))
                if objdump -T "${files[$i]}" 2>/dev/null | grep -q "GLIBC_2.4   socket$"; then
                    socketcount=$((socketcount+1))
                    table[$i]+="\"socket\","
                else
                    table[$i]+=","
                fi
            # We want to find Python and Perl scripts that use socket 
            # modules. There are multiple ways `file` could represent 
            # the script's type, but they all appear to include either
            # ASCII or UTF-8, so we just search for those. We avoid false
            # positives because, at this point, we're already limited to
            # scripts either marked as executable or, if not, scripts 
            # that *are* actually executed by systemd.
            elif file "${files[$i]}" | grep -q "ASCII\|UTF-8"; then 
                if cat "${files[$i]}" | grep -q "^\(import _*socket\|use \(IO::\)*Socket.*$\)"; then 
                    socketcount=$((socketcount+1))
                    table[$i]+="\"socket\","
                else
                    table[$i]+=","
                fi
            else
                table[$i]+=","
            fi

            # Since we run as root, we just check that the file is both
            # owned by root and that it has the SETUID bit set.
            if [ -O "${files[$i]}" -a -u "${files[$i]}" ] ; then
                    suidrootcount=$((suidrootcount+1))
                    table[$i]+="\"suidroot\","
            else
                table[$i]+=","
            fi

            # Last, we check if the file was also found in our autostarts
            # list, indicating that it is launched by a unit file of
            # systemd or is a related dependency.
            if [[ " ${autostarts[@]} "  =~ " ${files[$i]} " ]] ; then
                autostartcount=$((autostartcount+1))
                table[$i]+="\"autostart\""
            else
                table[$i]+=""
            fi
    done
    echo -e "\r\033[1A\033[K$MSG Done!" && echo -en "\033[K"
    echo "------------------------------------"
    echo "   Executables: ${#files[@]}"
    echo "          ELFs: $elfcount"
    echo "    SUID Roots: $suidrootcount"
    echo "    Autostarts: $autostartcount"
    echo "Imports socket: $socketcount"
    printf "%s\n" "${table[@]}" > $(hostname -s)_files.txt
    echo "------------------------------------"
}
exec 3>&1
exec 4>&2
realtime=$({ time main "$@" 1>&3 2>&4; } 2>&1)
echo "$realtime" | awk 'NR == 2 {print "Completed in: "$2}'
echo "------------------------------------"
exec 3>&-
exec 4>&-
