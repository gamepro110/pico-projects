#!/bin/bash

set -e

DISTINFO=$(cat /etc/*-release | grep DISTRIB_ID)

# installing dependencies
case $DISTINFO in
    *"manjaro"*) ;& # if manjaro (fallthrough to arch)
    *"arch"*) # if arch
        PKGS="base-devel cmake arm-none-eabi-newlib arm-none-eabi-gcc arm-none-eabi-binutils arm-none-eabi-gdb git"
        sudo pacman -S --needed $PKGS
        ;;

    *"Ubuntu"*) ;& # if debian based
    *"pop-os"*) ;&
    *"Debian"*)
        PKGS="cmake build-essential gcc-arm-none-eabi gdb libnewlib-arm-none-eabi git"
        sudo apt install $PKGS
        ;;
esac

# cloning pico projects
REPOS="-sdk -playground -examples"
PREFIX="https://github.com/raspberrypi/"
SUFFIX=".git"

for REPO in $REPOS
do
    cd ~
    DEST="$(echo ~)/pico${REPO}"

    # skip if clone exists, otherwise clone and init submodules
    if [ -d "$DEST" -a ! -h "$DEST" ]
    then
        echo "dir $DEST exists, skipping"
    else
        echo "dir $DEST not found, cloning it."
        URL="${PREFIX}pico${REPO}${SUFFIX}"
        git clone -b master $URL

        #submodules
        cd $DEST
        git submodule update --init
        cd -
    fi

    # outputting to /dev/null to prevent output to the terminal
    cd - > /dev/null
done

# adding sdk to path
echo "checking if \$PATH contains the pico-sdk"
if [[ "$PATH" == *"pico-sdk"* ]]; then
    echo "sdk path already in \$PATH variable"
else
    echo "adding sdk path to \$PATH variable"

    FILE="$(echo ~)/.zshrc"
    if [ ! -f "$FILE" ]
    then
        FILE="$(echo ~)/.zshrc"
    fi

    echo "adding to path in '$FILE'"
    echo "export PATH='/home/$USER/pico-sdk:$PATH'" >> ${FILE}
    echo "restart shell session to finish"
fi

