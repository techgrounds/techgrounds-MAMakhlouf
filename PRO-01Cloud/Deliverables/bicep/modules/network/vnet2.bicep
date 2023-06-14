param location string = resourceGroup().location
param vnet2Name string = 'management-prd-vnet'
param subnet2Name string = 'management-prd-subnet'
param nsg2Name string = 'management-prd-nsg'

resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet2Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.20.20.0/24'
      ]
    }
  }
}

resource subnet2 'Microsoft.Network/virtualNetworks/subnets@2022-11-01'= {
  name: '${vnet2Name}${subnet2Name}'
  parent: vnet2
  properties: {
    addressPrefix: '10.20.20.0/24'
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Disabled'
    networkSecurityGroup: {
      id: nsg2.id
    }
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

