targetScope = 'subscription'

param location string = 'westeurope'

param rgName string = 'rg1'

module resourceGroupModule '../Deliverables/bicep/modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupModule'
  scope: subscription()
  params: {
    rgName: rgName
    location: location
  }
}

module networking '../Deliverables/bicep/modules/network/network.bicep' = {
  name: 'networking-${location}'
  scope: resourceGroup(rgName)
  params: {
    location: location
  }
}

