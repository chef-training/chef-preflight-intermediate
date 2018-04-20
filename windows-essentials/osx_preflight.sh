#!/bin/sh
# Chef pre-flight test script for OSX machines

# Set these for colorized output
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)
col=40

# Sanity Check: Do I have gcc and make?

# Define tools here to keep things DRY
tools=(\
  gcc \
  make
)

for tool in ${tools[*]}; do
  /usr/bin/which $tool 2>&1 >/dev/null

  if [ $? -eq 0 ]; then
    printf '%-50s%*s%s\n' "Checking $tool" $col "${green}[OK]${normal}"
  else
    printf '%-50s%*s%s\n' "Checking $tool" $col "${red}[FAIL]${normal}"
  fi
done

# Now run the shared *nix stuff
./unix_preflight.sh