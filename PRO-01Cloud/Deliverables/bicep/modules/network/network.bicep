param location string 

@description('Variables for VNet1 and subnet.')
var vnet1Name = '${take(location, 6)}-vnet1'
var vnet1AddressPrefix = '10.10.10.0/24'

@description('Variables for VNet2 and subnet.')
var vnet2Name = '${take(location, 6)}-vnet2'
var vnet2AddressPrefix = '10.10.20.0/24'

@description('Virtual network 1 and subnet for VNet1.')
resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet1Name
  location: location
  tags: {
    Location: location
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet1AddressPrefix
      ]
    } 
    subnets: [
      {
        name: '${vnet1Name}-subnet1'
        properties: {
          addressPrefix: vnet1AddressPrefix
          networkSecurityGroup: {
            id: nsg1.id
          }
        }
      }
    ]
  }
}

@description('Virtual network 2 and subnet for VNet2.')
resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: vnet2Name
  location: location
  tags: {
    Location: location
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet2AddressPrefix
      ]
    }
    subnets: [
      {
        name: '${vnet2Name}-subnet1'
        properties: {
          addressPrefix: vnet2AddressPrefix
          networkSecurityGroup: {
            id: nsg2.id
          }
          serviceEndpoints: [
            {
              service: 'Microsoft.KeyVault'
              locations: [
                location
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
  }
}

@description('Peering between VNet1 and VNet2.')
resource vnet1vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-11-01' = {
  parent: vnet1
  name: '${vnet1Name}-${vnet2Name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: true
    allowGatewayTransit: true
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet2.id
    }
  }
}

@description('Network security group for vnet1. Allows access to the webserver via public IP and SSH from trusted locations.')
resource nsg1 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: '${vnet1Name}-nsg'
  location: location
  tags: {
    Location: location
  }
  properties: {
    securityRules: [
      {
        name: 'https'
        properties: { //fix when webserver is up!!!!!!!!!!!!!!
          protocol: 'TCP'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '443'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'http'
        properties: { //fix when webserver is up!!!!!!!!!!!!!!
          protocol: 'TCP'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          sourcePortRange: '*'
          destinationPortRange: '80'
          access: 'Allow'
          priority: 200
          direction: 'Inbound'
        }
      }
        {
        name: 'ssh'
        properties: {
          protocol: 'TCP'
          sourceAddressPrefix: '10.10.20.10' //fill this in when the management server is up!!!!!!!!!!!!!!!!!!!!!
          sourcePortRange: '*' //fill this in when the management server is up!!!!!!!!!!!!!!!!!!!!!
          destinationAddressPrefix: '*' //fill this in when the management server is up!!!!!!!!!!!!!!!!!!!!!
          destinationPortRange: '22' //fill this in when the management server is up!!!!!!!!!!!!!!!!!!!!!
          access: 'Allow'
          priority: 300
          direction: 'Inbound'
        }
      }
    ]
  }
}

@description('Network Security Group for vnet2. Allows access to the management server via public IP from trusted locations.')
resource nsg2 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
name: '${vnet2Name}-nsg'
location: location
tags: {
  Location: location
}
properties: {
  securityRules: [
    {
      name: 'ssh'
      properties: {
        protocol: 'TCP'
        sourceAddressPrefix: '*' //allowed ip addresses!!!!!!
        destinationAddressPrefix: '*'
        sourcePortRange: '*'
        destinationPortRange: '22'
        access: 'Allow'
        priority: 400
        direction: 'Inbound'
        }    
      }
    {
        name: 'RDP'
        properties: {
        protocol: 'TCP'
        sourceAddressPrefix: '*' //allowed ip addresses!!!!!!
        destinationAddressPrefix: '*'
        sourcePortRange: '*'
        destinationPortRange: '3389'
        access: 'Allow'
        priority: 1100
        direction: 'Inbound'
          }
        }
      ]
    }
  }

@description('Outputs for other resources to be connected')
output vnet1ID string = vnet1.name
output vnet1Subnet1ID string = vnet1.properties.subnets[0].name

output vnet2ID string = vnet2.name
output vnet2Subnet2ID string = vnet2.properties.subnets[0].name



output nsg1Name string = nsg1.name
output nsg1Id string = nsg1.id
output nsg2Name string = nsg2.name
output nsg2Id string = nsg2.id
