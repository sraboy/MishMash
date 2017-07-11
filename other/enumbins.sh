#!/bin/bash

declare -a socket
declare -a connect
declare -a suid
declare -a listen
declare -a fileinfo

checksocket() {
    file=$1
    if objdump -T $file 2>/dev/null | grep -wq "GLIBC_2.4   socket" ; then 
        #echo "$f has socket"
        socket+=($file)
    fi
}

checkconnect() {
    file=$1
    if objdump -T $file 2>/dev/null | grep -wq "GLIBC_2.4   connect" ; then 
        connect+=($file)
    fi
}

checklisten() {
    file=$1
    if objdump -T $file 2>/dev/null | grep -wq "GLIBC_2.4   listen" ; then 
        listen+=($file)
    fi
}

checksuidroot() {
    file=$1
    if [ -O "$file" -a -u "$file" ] ; then 
        suid+=($file)
    fi
}

main() {
    
	if [ "$EUID" -ne 0 ]; then
		(>&2 echo "Please run as root!")
		exit
	fi
	
	#files=`find / -executable -type f`   #this one ignores libraries
    echo "Finding all 32-bit ELF binaries in $1"
    files=`find $1 -exec file {} \; | grep "ELF 32-bit"`
    
    echo "Checking imports and getting file info"
    
    for f in $files
    do 
        #echo "Checking $f"
        checksocket $f
        checkconnect $f
        checklisten $f
        checksuidroot $f
        fileinfo+=($f','`file $f`)
    done


    echo "Socket binaries:"
    for f in "${socket[@]}"
    do
        echo $f
    done
    
    echo "Listen binaries:"
    for f in "${listen[@]}"
    do
        echo $f
    done
    
    echo "Connect binaries:"
    for f in "${connect[@]}"
    do
        echo $f
    done
    
    echo "SUID root binaries:"
    for f in "${suid[@]}"
    do
        echo $f
    done
    
    echo "File info:"
    for f in "${fileinfo[@]}"
    do
        echo $f
    done
}

main "$@"
