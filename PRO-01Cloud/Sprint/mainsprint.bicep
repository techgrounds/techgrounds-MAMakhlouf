targetScope = 'subscription'



@description('Sets the location for deployment')
param location string = 'westeurope'

@description('Sets the resource group name for deployment')
param resourceGroupName string = 'app-prd-rg'



@description('Deploys the resource group')
module resourceGroupDeployment '../Deliverables/bicep/modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupDeployment'
  params: {
    location: location
  }
}

@description('Deploys the virtual network 1')
module vnetsDeployment '../Deliverables/bicep/modules/network/vnets.bicep' = {
  name: 'vnet1Deployment'
  scope: resourceGroup(resourceGroupName)
  params:  {
    location: location
  }
}

