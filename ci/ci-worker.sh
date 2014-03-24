#!/bin/bash
# Build, test application. Will print the compile error and a red "ERROR" if any,
# the first failing test and a yellow "FAIL" if there's a failing test,
# or a green "PASS" if all is well.

figletfont=banner3

green="$(tput setab 22)$(tput setaf 84)$(tput bold)"
yellow="$(tput setab 208)$(tput setaf 226)$(tput bold)"
red="$(tput setab 52)$(tput setaf 196)$(tput bold)"
black=$(tput sgr0)

clear
compile_output=`ghc Main.hs 2>&1`
if [ $? -ne 0 ]; then
    echo -e $red
    figlet -w150 -f $figletfont ERROR
    echo -e $black
    echo -e "$compile_output"
    exit 1
fi

output=`./Main`
if [ $? -ne 0 ]; then
    echo -e $yellow
    figlet -w150 -f $figletfont FAIL
    echo -e $black
    echo "$output"
else
    echo -e $green
    figlet -w150 -f $figletfont PASS
    echo -e $black
fi
