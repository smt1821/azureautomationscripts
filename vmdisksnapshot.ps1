Import-Module 'Az.Accounts'
Import-Module 'Az.Compute'

Connect-AzAccount -Identity

$resourceGroupName = 'xxxxx' 
$location = 'xxxx' 
$vmName = 'xxxxx'
$snapshotName = 'xxxxx'

$vm = Get-AzVM `
    -ResourceGroupName $resourceGroupName `
    -Name $vmName

    $snapshot =  New-AzSnapshotConfig `
    -SourceUri $vm.StorageProfile.OsDisk.ManagedDisk.Id `
    -Location $location `
    -CreateOption copy

    New-AzSnapshot `
    -Snapshot $snapshot `
    -SnapshotName $snapshotName `
    -ResourceGroupName $resourceGroupName

