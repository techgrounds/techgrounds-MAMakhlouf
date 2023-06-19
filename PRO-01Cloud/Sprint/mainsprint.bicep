targetScope = 'subscription'

param location string = 'westeurope'

param resourceGroupName string = 'app-prd-rg'




module resourceGroupDeployment '../Deliverables/bicep/modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupDeployment'
  params: {
    location: location
  }
}

module vnet1 '../Deliverables/bicep/modules/network/vnet1.bicep' = {
  name: 'vnet1Deployment'
  scope: resourceGroup(resourceGroupName)
  params:  {
    location: location
  }
}

module vnet2 '../Deliverables/bicep/modules/network/vnet2.bicep' = {
  name: 'vnet2Deployment'
  scope: resourceGroup(resourceGroupName)
  params:  {
    location: location
  }
}


output locationOutput string = location
