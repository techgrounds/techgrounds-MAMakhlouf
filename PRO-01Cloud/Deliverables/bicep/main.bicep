targetScope = 'subscription'

param location string = 'westeurope'
@secure()
param adminUserName string 
@secure()
param adminPassword string 

param resourceGroupName string = 'app-prd-rg'

//param storageAccountName string = 'storageaccount'
//param backupVaultName string = 'backupvault'

module resourceGroupDeployment './modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupDeployment'
  params: {
    location: location
  }
}

module vnet1 './modules/network/vnet1.bicep' = {
  name: 'vnet1Deployment'
  scope: resourceGroup(resourceGroupName)
  params:  {
    location: location
  }
}



module webServer 'modules/web/webServer.bicep' = {
  name: 'webServerDeployment'
  scope: resourceGroup(resourceGroupName)
  params: {
    location: location
    adminUserName: adminUserName
    adminPassword: adminPassword
  }
}

module vnet2 './modules/network/vnet2.bicep' = {
  name: 'vnet2Deployment'
  scope: resourceGroup(resourceGroupName)
  params:  {
    location: location
  }
}

module managementServer './modules/database/managementServer.bicep' = {
  name: 'managementServerDeployment'
  scope: resourceGroup(resourceGroupName)
  params: {
    location: location
    managementServerName: 'managementServerDeployment'
    adminUserName: adminUserName
    adminPassword: adminPassword
  }
}

output vnet1Name string = vnet1.name
output vnet1Id string = vnet1.outputs.vnet1Id
output subnet1Name string = vnet1.outputs.subnet1Name
output subnet1Ref string = vnet1.outputs.subnet1Ref
output subnet1Id string = vnet1.outputs.subnet1Id
output webServerResourceId string = webServer.outputs.webServerResourceId
