param location string = resourceGroup().location
param vnet2Name string = 'management-prd-vnet'
param subnet2Name string = 'management-prd-subnet'
param nsg2Name string = 'management-prd-nsg'

var vnet2AddressPrefix = '10.20.20.0/16'
var managementServerAddressPrefix = '10.20.20.0/24'


resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet2Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet2AddressPrefix
      ]
    }
    subnets: [ {
      name: subnet2Name
      properties: {
        addressPrefix: managementServerAddressPrefix
        privateEndpointNetworkPolicies: 'Disabled'
        privateLinkServiceNetworkPolicies: 'Disabled'
    networkSecurityGroup: {
      id: nsg2.id
     }
    }
   }
  ]
 }
}


resource nsg2 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: nsg2Name
  location: location
  properties: {
    securityRules: [
      // Define security rules for management server
    ]
  }
}

output vnet2Name string = vnet2.name
output vnet2Id string = vnet2.id

output vnet2AddressPrefix string = vnet2.properties.addressSpace.addressPrefixes[0]
output managementServerAddressPrefix string = vnet2.properties.subnets[0].properties.addressPrefix
