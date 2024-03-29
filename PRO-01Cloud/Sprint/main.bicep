targetScope = 'subscription'

param location string = 'westeurope'

param rgName string = 'app-prd-rg'


@secure()
param adminUserName string 

@secure()
param adminPassword string



module resourceGroupModule '../Deliverables/bicep/modules/network/network.bicep' = {
  name: 'resourceGroupDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
  }
}

module networking '../Deliverables/bicep/modules/network/network.bicep' = {
  name: 'networkDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
  }
  dependsOn: [
    resourceGroupModule
  ]
}


module managementServer '../Deliverables/bicep/modules/database/managementServer.bicep' = {
  name: 'managementServerDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
    adminUserName: adminUserName
    adminPassword: adminPassword
    vnet2ID: networking.outputs.vnet2ID
    vnet2Subnet2ID: networking.outputs.vnet2Subnet2ID
    diskencryption: keyVault.outputs.diskencryptset_id
    // nsg2Id: networking.outputs.nsg2Id
    storageAccountBlobEndpoint: storageAccount.outputs.storageAccountBlobEndpoint
  }
}

module webServerScaleSet '../Deliverables/bicep/modules/web/webScale.bicep' = {
  name: 'webServerDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
    adminUserName: adminUserName
    adminPassword: adminPassword
    vnet1ID: networking.outputs.vnet1ID
    vnet1Subnet1ID: networking.outputs.vnet1Subnet1ID
    diskencryption: keyVault.outputs.diskencryptset_id
    // vnet1Subnet2ID: networking.outputs.vnet2Subnet2ID
    // nsg3Id: networking.outputs.nsg3Id
    nsg1Id: networking.outputs.nsg1Id
  }
}

module keyVault '../Deliverables/bicep/modules/keyvault/keyvault.bicep' = {
  name: 'keyVaultDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
    adminUserName: adminUserName
    adminPassword: adminPassword
    vnet2ID: networking.outputs.vnet2ID
    vnet2Subnet2ID: networking.outputs.vnet2Subnet2ID
  }
}

module storageAccount '../Deliverables/bicep/modules/storageAccount/storageAccount.bicep' = {
  name: 'storageAccountDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
  }
  dependsOn: [
    resourceGroupModule
  ]
}


module sqlDeployment '../Deliverables/bicep/modules/database/singlesqlserver.bicep' = {
  name: 'sqlDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
    vnet1ID: networking.outputs.vnet1ID
    // vnet1Subnet3ID: networking.outputs.vnet1Subnet3ID
    // vnet2ID: networking.outputs.vnet2ID
    adminUserName: adminUserName
    adminPassword: adminPassword
    // nsg4Name: networking.outputs.nsg4Name
    
  }
}
