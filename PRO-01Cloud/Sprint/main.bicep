targetScope = 'subscription'

param location string = 'westeurope'

param rgName string = 'app-prd-rg'

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

