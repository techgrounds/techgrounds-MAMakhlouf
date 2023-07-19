targetScope = 'subscription'

param location string = 'westeurope'

param rgName string = 'app-prd-rg1'


@secure()
param adminUserName string 

@secure()
param adminPassword string



module resourceGroupModule './modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupDeployment'
  scope: subscription()
  params: {
    rgName: rgName
    location: location
  }
}

module networking './modules/network/networkSchets.bicep' = {
  name: 'networkDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
  }
  dependsOn: [
    resourceGroupModule
  ]
}


module managementServer './modules/database/managementSchets.bicep' = {
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

module webServerScaleSet 'modules/web/webSchets.bicep' = {
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

module keyVault 'modules/keyvault/keyvaultSchets.bicep' = {
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

module storageAccount 'modules/storageAccount/storageAccount.bicep' = {
  name: 'storageAccountDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
  }
  dependsOn: [
    resourceGroupModule
  ]
}


module sqlDeployment 'modules/database/singlesqlserver.bicep' = {
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
