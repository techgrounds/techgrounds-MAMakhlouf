targetScope = 'subscription'

@description('Sets the location for deployment')
param location string = 'westeurope'

@description('Sets the resource group name for deployment')
param resourceGroupName string = 'app-prd-rg'

// @secure()
// param keyVaultSecretN string 
// @secure()
// param keyVaultSecretP string



@description('Deploys the resource group')
module resourceGroupDeployment '../Deliverables/bicep/modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupDeployment'
  params: {
    location: location
  }
}

@description('Deploys the virtual networks')
module vnetsDeployment '../Deliverables/bicep/modules/network/vnets.bicep' = {
  name: 'vnetDeployment'
  scope: resourceGroup(resourceGroupName)
  params:  {
    location: location
  }
}

// @description('Deploys the management server')
// module managementServerDeployment '../Deliverables/bicep/modules/database/managementServer.bicep' = {
//   name: 'managementServerDeployment'
//   scope: resourceGroup(resourceGroupName)
//   params: {
//     location: location
//     subnet2ResourceId: vnetsDeployment.outputs.subnet2ResourceId
//     adminUserName: keyVaultDeployment.outputs.keyVaultSecretN 
//     adminPassword: keyVaultDeployment.outputs.keyVaultSecretP
//   }
// }

// @description('Deploys the Key Vault')
// module keyVaultDeployment '../Deliverables/bicep/modules/keyvault/keyvault.bicep' = {
//   name: 'keyVaultDeployment'
//   scope: resourceGroup(resourceGroupName)
//   params: {
//     location: location
//     adminUserName: keyVaultSecretN
//     adminPassword: keyVaultSecretP
//   }
// }
