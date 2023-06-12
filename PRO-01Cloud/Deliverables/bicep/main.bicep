targetScope = 'subscription'
@description('region that is used to host resources')
param location string = 'westeurope'
param vnet1IPRange string = '10.0.0.0/16'
param subnet1IPRange string = '10.0.0.0/24'

resource rg 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'rg1' 
  location: location
}

@description('This is a virtual network for the webserver')
resource vnetapp 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: 'vnet1'
  location: location
  properties: {
    addressSpace: {
       addressPrefixes: [
       vnet1IPRange
    ]
  }
  }
  
}

@description('This is a subnet where the webserver wil reside')
resource subnetapp 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: 'subnet1'
  parent: vnetapp
  properties: {
     addressPrefix: subnet1IPRange
 }
}




