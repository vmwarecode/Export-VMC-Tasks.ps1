# Simple script to export VMC Tasks to a CSV 
# Requires VMC PowerCLI Module.  Uncomment line 3 to install
# Install-Module -name VMware.VMC -scope AllUsers
$RefreshToken = Read-Host "Enter your Refresh Token"
Connect-Vmc -RefreshToken $RefreshToken
Get-VMCOrg | select display_name -outvariable myorg
$filelocation = Read-Host "Enter full path to export CSV, e.g. c:\temp\vmc-tasks.csv"
Get-VMCTask -org $myorg | export-csv $filelocation
Disconnect-Vmc -Confirm:$False