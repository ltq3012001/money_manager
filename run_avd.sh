#!/bin/bash
emulator=~/Android/Sdk/emulator/emulator 
${emulator} -list-avds
read -p "avd names:" avd
${emulator} -avd ${avd}