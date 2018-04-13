# Chef Essentials on Windows Training Pre-flight

We are going to verify that attendees are setup properly, and the facilities will not cause issues. 

## What do the scripts do?

* Do the users have local admin rights to install items to their systems?
  * If not, can they be granted?

Are users behind a proxy or other restrictive firewall?
Verify web connectivity to:

* aws.amazon.com
* manage.chef.com
* supermarket.chef.io
* api.chef.io
* rubygems.org
* portquiz.net
* downloads.chef.io/chef-dk
* github.com/chef-training

Verify RDP connectivity:
* Outbound to AWS

### Network Requirements

Outbound: ports 3389 (RDP) and 5985 (WinRM), * .chef.io, * .aws.amazon.com, and if possible, drive.google.com

We ask that you run the "pre-flight" script that Chef has put together and return the results to us in a timely fashion. To do this, please connect a typical laptop a student might be using to the network we will be utilizing for the class. 

Running the script will then generate a report of the network connectivity (preflight_results) and inform you if any critical servers cannot be reached. If failures are detected they will be logged in the resulting .txt or .csv file, which should be returned to us. It may be necessary to contact your networking team to resolve any issues before our trainer comes on-site.

# Instructions

## On Windows
1. download or clone the chef-preflight repository locally
2. open powershell as administrator
3. navigate to the chef-preflight/windows-essentials folder
4. execute `./windows_preflight.ps1`
5. execute `./http_preflight.ps1`
6. forward the preflight_results file to our team
7. address any issues

## On Linux/OSX
1. download or clone the chef-preflight repository locally
2. open term or shell
3. navigate to the chef-preflight/windows-essentials folder
  * execute `./osx_preflight.sh` on a mac   
  * execute `./unix_preflight.sh` on linux
4. forward the preflight_results file to our team
5. address any issues

# Execution Example

If we assume a Windows workstation, then for Chef Essentials on Windows course:

The simplest method is to navigate to the downloaded scripts in Windows Explorer (launched with WINDOWS + E ), right-clicking on the appropriate script, and clicking “Run with PowerShell”. You will need to give administrative access for the script to complete properly.

Alternatively:

1. Open a Powershell prompt. This can be done easily by using the keystroke ( WINDOWS + X + A ), or by opening the start menu ( WINDOWS ) and searching for “powershell”.

2. Navigate to the location where you downloaded the scripts to. This will most likely be your downloads directory. You can change into this directory by running the following inside of your powershell prompt:

  * cd ~\Downloads\

3. And then execute the script located inside of: chef-preflight-master -> windows-essentials -> windows_preflight.ps1

  * .\chef-preflight-master\windows-essentials\windows_preflight.ps1

  * You will want to run the executable from within the same environment (such as from within the classroom or on the same network) as we'll be using in class.  

4. Forward the generated “preflight_results.csv” file back to our team.

*Our team will review the results of the Pre-flight script and Please let me know if you need any further assistance with this. We are happy to help.*

*We’re looking forward to working with you and your team!*
