#This simple script creates an Azure Resource Group in a Subscription and Region specified in parameters.  It will also tag the Resource Group with the UPN of the user who ran scipt and current date/time. 

#Script created with PowerShell 7.0.3 and Az PowerShell 4.4.0

#Sign in to Azure with Connect-AzAccount prior to running script

#Parameters
$SubscriptionName = "Your Azure Subscription Name"
$Location = "Your Location (aka Region)"
$ResourceGroupName = "Your Resource Group Name"
$CurrentDate = get-date -Format "yyyy.MM.dd:HH.mm.ss"

#Set subscription context
write-host "Change context to $SubscriptionName" -ForegroundColor Green
Set-AzContext -SubscriptionName $SubscriptionName

$CurrentUser = Get-AzContext | Select-Object -ExpandProperty Account

#Create resource group
write-host "Creating Resource Group named $ResourceGroupName" -ForegroundColor Green
New-AzResourceGroup -Name $ResourceGroupName -Location $Location -Tag @{CreatedBy=$CurrentUser.Id;CreatedDate=$CurrentDate}

write-host "CreateResourceGroup.ps1 script completed successfully" -ForegroundColor Blue
