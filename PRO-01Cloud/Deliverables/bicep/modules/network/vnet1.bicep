param location string = resourceGroup().location
param vnet1Name string = 'app-prd-vnet'
param subnet1Name string = 'app-prd-subnet'
param nsg1Name string = 'app-prd-nsg'


resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01'= {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
  }
}

resource subnet1 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${vnet1Name}${subnet1Name}'
  parent: vnet1
  properties: {
    addressPrefix: '10.10.10.0/24'
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Disabled'
    networkSecurityGroup: {
      id: nsg1.id
    }
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

