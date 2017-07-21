#!/bin/bash

# Don't add any additional output to this function since stdout is what
# populates the actual array.
getautostarts() {
    read -ra ldpaths <<<`ldconfig -v 2>/dev/null | grep -v ^$'\t'`

    for ((i=0; i<${#ldpaths[@]}; i++)); do
        ldpaths[$i]="${ldpaths[$i]::-1}"
    done

    for f in `systemctl list-unit-files --type=service |
              grep -v disabled | head -n-2 | awk 'NR>1{print $1}'`; do
        path="/lib/systemd/system/$f"
        if [ -e "$path" ]; then
            echo "$path"
            else path="/etc/systemd/system/$f"
            if [ -e "$path" ]; then
                echo "$path"
            fi
        fi
        read -ra execfiles <<< `cat $path | grep "ExecStart" |
                           sed 's/\(ExecStart\|ExecStartPre\|ExecStartPost\)=-*\([^ ]\+\).*/\2/' |
                           xargs -i{} readlink -f {} 2>/dev/null |
                                sort -u`
        for ef in "${execfiles[@]}"; do
            if [ ! -z "${ef// }" ] && [ -e "$ef" ]; then
                    echo "$ef"
                    read -ra libs <<<`objdump -p $ef 2>/dev/null |
                                    grep NEEDED | awk '{print $2}'`
                    for lib in "${libs[@]}"; do
                        for prefix in "${ldpaths[@]}"; do
                            if [ -e "$prefix/$lib" ]; then
                                readlink -f "$prefix/$lib" 2>/dev/null
                            fi
                        done
                    done
            fi
        done
    done
}

missed=0
checkmissed() {
    for f in "${autostarts[@]}"; do
        if [[ ! " ${files[*]} " == *"$f"* ]]; then
            echo "An autostart binary loads the non-executable library: $f"
            files+=("$f")
            missed=$((missed+1))
        fi
    done
}


echo "Checking systemd unit files for auto-starts..."
read -ra autostarts<<<`getautostarts | grep -v -e "^.*systemd.*\.service" | sort -u`
rootloc="/"
echo "Finding all executables in $rootloc..."
# We could use `find / -executable -type f` but this is more portable.
# Still, `-type f` isn't always supported. Obviously, we'll miss the
# files that could be executables but not marked with the required
# permissions bit. That's still a potential vector of attack but this
# covers most cases and, later, we'll get imported libraries too.
read -ra files <<< `find $rootloc -perm /111 -type f 2>/dev/null`
echo "Found ${#files[@]} executables"
echo "Checking for missed files..."
checkmissed
echo "Added $missed missed files"

elf32="ELF 32-bit"
elf64="ELF 64-bit"
elfcount=0
socketcount=0
suidrootcount=0
autostartcount=0
declare -a table

#finding exes
#finding elves
#merging lists

main() {
    if [ "$EUID" -ne 0 ]; then
        (>&2 echo "Please run as root!")
        exit
    fi
    echo "Checking ${#files[@]} executables. Please wait..."
    echo
    # Now we'll iterate and get `file` output for each executable and
    # also find all ELFs which import the functions we're interested in.
    # You should manually check a few files with `objdump -T` to see
    # exactly what the output looks like so you can `grep` properly.
    for ((i=0; i<${#files[@]}; i++)); do
            
            # Fancy shmancy output
            echo -en "\e[1A"
            echo -e "\e[0KChecking file $((i+1))/${#files[@]}: ${files[$i]}" &&
            
            # We add the output of `file` to our table so we know what
            # we're looking at. However, `file` outputs:
            # "filename: <stuff>". We don't want that space so we use -b
            # to skip outputting the filename and do that ourselves.
            table[$i]="\"${files[$i]}\",\""`file -b ${files[$i]}`"\","
            
            # We check for both 32- and 64-bit ELF files since a 64-bit
            # machine can run 32-bit ELFs. Technically, this will produce
            # false-positives if a file is named "ELF (32|64)-bit."
            if [[ "${table[$i]}" == *"$elf32"* ]] || [[ "${table[$i]}" == *"$elf64"* ]]; then
                elfcount=$((elfcount+1))
                if `objdump -T "${files[$i]}" 2>/dev/null | grep -q "GLIBC_2.4   socket"`; then
                    socketcount=$((socketcount+1))
                    table[$i]+="socket,"
                else
                    table[$i]+=","
                fi
            fi

            # Since we run as root, we just check that the file is both
            # owned by root and that it has the SETUID bit set.
            if [ -O "${files[$i]}" -a -u "${files[$i]}" ] ; then
                    suidrootcount=$((suidrootcount+1))
                    table[$i]+="suidroot,"
            else
                table[$i]+=","
            fi

            # Last, we check if the file was also found in our autostarts
            # list, indicating that it is launched by a unit file of 
            # systemd or is a related dependency.
            if [[ " ${autostarts[@]} "  =~ " ${files[$i]} " ]] ; then
                autostartcount=$((autostartcount+1))
                table[$i]+="autostart"
            fi
    done
}
main "$@"
echo "Done!"    
echo "------------------------------------"
echo "   Executables: ${#files[@]}"
echo "          ELFs: $elfcount"
echo "    SUID Roots: $suidrootcount"
echo "    Autostarts: $autostartcount"
echo "Imports socket: $socketcount"
#echo "DEBUG Autostarts array count: ${#autostarts[@]}"
printf "%s\n" "${table[@]}" > files.txt
