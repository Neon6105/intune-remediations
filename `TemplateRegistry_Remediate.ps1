#==================================================
# Script Name : _Remediate.ps1
# Synopsis    : Remediate registry value for 
# Description : 
# Notes       : 
# Last update : 
#==================================================

$RegistryPath = "HKLM:\Path\To\Key"
$RegistryName = "RegistryItem"
$RegistryValue = 0
$RegistryType = "Dword"

try {
  If(!(Test-Path $RegistryPath)) { New-Item "$RegistryPath" -Force }
  New-ItemProperty -Path $RegistryPath -Name $RegistryName -Value $RegistryValue -Type "$RegistryType" -Force
  Write-Output "Successfully updated the registry!"
  Exit 0
} catch {
  $ErrorMsg = $_.Exception.Message
  Write-Error $ErrorMsg
  Exit 1
}
Write-Output "Something went wrong..."
Exit 1