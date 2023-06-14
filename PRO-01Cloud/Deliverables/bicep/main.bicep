targetScope = 'subscription'

param location string = 'westeurope'


//param keyVaultName string = 'keyvault'
//param storageAccountName string = 'storageaccount'
//param backupVaultName string = 'backupvault'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'test'
  location: location

}

module vnet1 './modules/network/vnet1.bicep' = {
  name: 'vnet1Deployment'
  scope: resourceGroup
  params:  {
    location: location
  }
}
module vnet2 './modules/network/vnet2.bicep' = {
  name: 'vnet2Deployment'
  scope: resourceGroup
  params: {
    location: location
  }
}

module managementServer './modules/database/managementServer.bicep' = {
  name: 'managementServerDeployment'
  scope: resourceGroup
  params: {
    location: location
    managementServerName: managementServerName
    adminUserName: adminUserName
    adminPassword: adminPassword
  }
}

module webServer 'modules/web/webServer.bicep' = {
  name: 'webServerDeployment'
  scope: resourceGroup
  params: {
    location: location
  }
}




