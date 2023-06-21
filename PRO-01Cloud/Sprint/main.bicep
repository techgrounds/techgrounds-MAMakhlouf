targetScope = 'subscription'

param location string = 'westeurope'

param rgName string = 'app-prd-rg'

@secure()
param adminUserName string 

@secure()
param adminPassword string

module resourceGroupModule '../Deliverables/bicep/modules/resourcegroup/resourcegroup.bicep' = {
  name: 'resourceGroupDeployment'
  scope: subscription()
  params: {
    rgName: rgName
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
  }
}


module webServer '../Deliverables/bicep/modules/web/webServer.bicep' = {
  name: 'webServerDeployment'
  scope: resourceGroup(rgName)
  params: {
    location: location
    adminUserName: adminUserName
    adminPassword: adminPassword
    vnet1ID: networking.outputs.vnet1ID
    vnet1Subnet1ID: networking.outputs.vnet1Subnet1ID
  }
}
