#==================================================
# Script Name : LocalUserAccountCleanup_Detect.ps1
# Synopsis    : Detect unwanted local user accounts
# Last update : 2023.08.21 (script created)
#=======================================================================

$RemoveLocalUsers = @("LocalUser1", "Local User 2", "LocalUser 3")

ForEach ($Username in $RemoveLocalUsers) {
  $LocalUser = Get-LocalUser $Username -ErrorAction SilentlyContinue
  # If the user exists locally...
  If ($LocalUser) {
    Write-Output "Unwanted local account found! $Username"
    Exit 1
  }
}
Write-Output "Nobody here but us chickens!"
Exit 0