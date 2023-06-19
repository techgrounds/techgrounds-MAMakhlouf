param location string = resourceGroup().location
param vnet1Name string = 'app-prd-vnet'
param subnet1Name string = 'app-prd-subnet'
param nsg1Name string = 'app-prd-nsg'

var subnetRef = resourceId('Microsoft.Network/virtualNetworks/subnets', vnet1Name, subnet1Name)

resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01'= {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
    subnets: [
      {
        name: subnet1Name
        properties: {
          addressPrefix: '10.10.10.0/24'
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
      // Define security rules for web server
    ]
  }
}



output vnet1Name string = vnet1.name
output vnet1Id string = vnet1.id
output subnet1Name string = subnet1Name
output subnet1Ref string = subnetRef
output subnet1Id string = vnet1.properties.subnets[0].id
output nsgId string = nsg1.id
