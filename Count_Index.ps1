param (
    [Parameter(Mandatory=$false)] 
    [Int]  $Desired_Session_Host_Number = 12,
    [Parameter(Mandatory=$false)] 
    [String] $Session_Host_prefix = "WEASWVD04P",
    [Parameter(Mandatory=$false)] 
    [String] $ResourceGroupName = "rg-wvd-eas-prd-com-01",
    [Parameter(Mandatory=$false)] 
    [Int] $Exist_Session_Host_Count_Number = 3
)

#Get Exist VMs Count Number
# $Exist_Session_Hosts = (Get-AzVM -ResourceGroupName $ResourceGroupName -Name *"$Session_Host_prefix"*).Name
# $Exist_Session_Host_Count_Number = [int]$Exist_Session_Hosts.IndexOf(($Exist_Session_Hosts | Select-Object -Last 1)) + 1

$New_Session_Host_list = @()
$Initial_Desired_Session_Host_Number = 1

if ([int]$Exist_Session_Host_Count_Number -ge $Initial_Desired_Session_Host_Number ){
    [string]$Initial_Desired_Session_Host_Number = $Exist_Session_Host_Count_Number
}   
else{
    $Initial_Desired_Session_Host_Number = 0
}

$item_num = [int]$Initial_Desired_Session_Host_Number +1

for ($i=1 ; $i -le $Desired_Session_Host_Number; $i++){ 
    # Write-Output $item_num.GetType()
    $New_Session_Host_prefix_Count = $item_num.Tostring('0000')
    $New_Session_Host_prefix = $Session_Host_prefix+"-"+$New_Session_Host_prefix_Count
    $New_Session_Host_list += $New_Session_Host_prefix
    $item_num++
}
Write-Output $New_Session_Host_list
