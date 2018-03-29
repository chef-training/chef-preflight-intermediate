Customer responsibility:

Adequate hardware for the attendees.  
List of the Attendees, E-Mail Address, Role (i.e. sysadmin, developer, etc).

It is critical to know who is attending for the best experience.

We are going to verify that ALL attendees are setup properly, and the facilities will not cause issues. 

# On Windows
1. download or clone the repository locally
1. open powershell as administrator
1. navigate to the chef-preflight folder
1. execute `./windows_preflight.ps1`
1. execute `./http_preflight.ps1`
1. address any issues

# On Linux/OSX
1. download or clone the repository locally
1. open term or shell
1. navigate to the chef-preflight folder
 *  execute `./osx_preflight.sh` on a mac   
 *  execute `./unix_preflight.sh` on linux
1. address any issues

# What do the scripts do?

Workstation:

* Do the users have local admin rights to install items to their systems?
  * If not, can they be granted?

Are users behind a proxy or other restrictive firewall?
Verify web connectivity to:

* manage.chef.com
* supermarket.chef.io
* api.chef.io

Verify SSH and/or RDP connectivity:
* Outbound to AWS
