#==================================================
# Script Name : _Detect.ps1
# Synopsis    : Detection registry value for 
# Description : 
# Notes       : 
# Last update : 
#==================================================

$RegistryPath = "HKLM:\Path\To\Key"
$RegistryName = "RegistryItem"
$RegistryValue = 0

try {
  $CurrentValue = Get-ItemPropertyValue -Path $RegistryPath -Name $RegistryName
  If ($CurrentValue -eq $RegistryValue) {
    Write-Output "$CurrentValue is equal to expected value $RegistryValue"
    Exit 0
  }
} catch {
    $ErrorMsg = $_.Exception.Message
    Write-Error $ErrorMsg
    Exit 1
}
Write-Output "Value is set, but not equal to $RegistryValue"
Exit 1