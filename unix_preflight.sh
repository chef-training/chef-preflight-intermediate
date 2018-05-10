#!/bin/sh
# Chef pre-flight test script for Linux and OSX machines
# vim: ai ts=2 sw=2 et sts=2 ft=sh
# vim: autoindent tabstop=2 shiftwidth=2 expandtab softtabstop=2 filetype=sh

# Prerequisites:  
# CentOS:  bind-utils, nc
# Ubuntu:  dnsutils, netcat

# set file name for output as preflight_results_TIMESTAMP.txt
results_file="preflight_results_`date +%Y-%m-%d-%H%M%S`".txt

# Set these for colorized output
red=$(tput setaf 1)
green=$(tput setaf 2)
normal=$(tput sgr0)

echo
echo "We are validating your admin privileges."
echo "Unless you have passwordless sudo enabled on your user account, you will be prompted for your local password."

# Do I have local admin rights?
[ "$(sudo -l | grep \(ALL\))" ] && hazadmin=true

echo
echo "###############################################################################"
col=40
if [ "$hazadmin" == "true" ]; then
  printf '%-50s%*s%s\n' "Checking sudo rights..." $col "${green}[OK]${normal}" | tee -a $results_file
else
  printf '%-50s%*s%s\n' "Checking sudo rights..." $col "${red}[FAIL]${normal}" | tee -a $results_file
fi


# Can I reach these Internet sites
sites=(\
  aws.amazon.com \
  manage.chef.io \
  supermarket.chef.io \
  api.chef.io \
  rubygems.org \
  portquiz.net
)

urls=(\
  https:\/\/downloads.chef.io\/chef-dk\/ \
  https:\/\/github.com\/chef-training/
)

echo
echo "###############################################################################"
echo "Testing DNS resolvers..."
echo 
col=40
for site in ${sites[*]}; do
  #dig $site 2>&1 >/dev/null
  dig $site | grep -v SERVER | grep -q -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'
  if [ $? -eq 0 ]; then
    printf '%-50s%*s%s\n' "Checking DNS for $site" $col "${green}[OK]${normal}" | tee -a $results_file
  else
    printf '%-50s%*s%s\n' "Checking DNS for $site" $col "${red}[FAIL]${normal}" | tee -a $results_file
  fi
done

echo
echo "###############################################################################"
echo "Checking connectivity to Internet sites..."
echo 

col=40
for site in ${sites[*]}; do
  curl -s $site 2>&1 >/dev/null
  if [ $? -eq 0 ]; then
    printf '%-50s%*s%s\n' "Checking $site" $col "${green}[OK]${normal}" | tee -a $results_file
  else
    printf '%-50s%*s%s\n' "Checking $site" $col "${red}[FAIL]${normal}" | tee -a $results_file
  fi
done

col=40
for url in ${urls[*]}; do
  curl -s $url 2>&1 >/dev/null
  if [ $? -eq 0 ]; then
    printf '%-50s%*s%s\n' "Checking $url" $col "${green}[OK]${normal}" | tee -a $results_file
  else
    printf '%-50s%*s%s\n' "Checking $url" $col "${red}[FAIL]${normal}" | tee -a $results_file
  fi
done

# Am I blocked outbound on any of these ports?
# NOTE: Currently requires that portquiz.net is unblocked. Check for site check failure if this fails to rule out false positive.

ports=(\
  22 \
  3389
  )

echo
echo "###############################################################################"
echo "Checking outgoing SSH and RDP ports..."
echo 

col=40
for port in ${ports[*]}; do
  nc -w 1 portquiz.net $port 2>&1 >/dev/null
  if [ $? -eq 0 ]; then
    printf '%-50s%*s%s\n' "Checking port $port" $col "${green}[OK]${normal}" | tee -a $results_file
  else
    printf '%-50s%*s%s\n' "Checking port $port" $col "${red}[FAIL]${normal}" | tee -a $results_file
  fi
done

