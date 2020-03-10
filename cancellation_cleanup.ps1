$packerRG = (Get-AzResourceGroup -Name packer-Resource-Group* -ErrorVariable notPresent -ErrorAction SilentlyContinue).ResourceGroupName

if (!$packerRG) {
  Write-Output "Packer Resource Group wasn't created"
} elseif ($notPresent) {
  Write-Error "Get-Az failed to retreived any resource group." 
} else {
  Write-Output "Found Packer Resource Group: $packerRG ... removing..."
  if (Remove-AzResourceGroup -Name "$packerRG" -Force) {
    Write-Output "Resource Group $packerRG has been removed."
  } else {
    Write-Error "Resource Group $packerRG was NOT removed successfully... please go to portal.azure.com and fix manually"
  }
}

