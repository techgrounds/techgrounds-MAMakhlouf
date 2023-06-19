targetScope = 'resourceGroup'
param location string = resourceGroup().location

param vnet1Name string = 'app-prd-vnet'
param subnet1Name string = 'app-prd-subnet'
param nsg1Name string = 'app-prd-nsg'


param vnet2Name string = 'management-prd-vnet'
param subnet2Name string = 'management-prd-subnet'
param nsg2Name string = 'management-prd-nsg'

var vnet2AddressPrefix = '10.20.20.0/16'
var managementServerAddressPrefix = '10.20.20.0/24'


var vnet1AddressPrefix = '10.10.10.0/16'
var webServerAddressPrefix = '10.10.10.0/24'


resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01'= {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet1AddressPrefix
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: webServerAddressPrefix
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Disabled'
    networkSecurityGroup: {
      id: nsg1.id
     }
    }
   }
  ]
 }
}


resource nsg1 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: nsg1Name
  location: location
  properties: {
    securityRules: [
          {
      }
      // Define security rules for web server
    ]
  }
}



output vnet1Name string = vnet1.name
output vnet1Id string = vnet1.id
output subnet1Name string = subnet1Name
output subnet1Id string = vnet1.properties.subnets[0].id
output nsg1Id string = nsg1.id
output webServerAddressPrefix string = webServerAddressPrefix
output vnet1AddressPrefix string = vnet1AddressPrefix



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
output subnet2Name string = subnet2Name
output subnet2Id string = vnet2.properties.subnets[0].id
output subnet2ResourceId string = vnet2.properties.subnets[0].properties.networkSecurityGroup.id
output nsg2Id string = nsg2.id
output vnet2AddressPrefix string = vnet2.properties.addressSpace.addressPrefixes[0]
output managementServerAddressPrefix string = vnet2.properties.subnets[0].properties.addressPrefix

resource vnetpeering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-11-01' = {
  name: '${vnet1Name}-${vnet2Name}'
  parent: vnet1
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet2.id
    }
  }
 
}
