param serverName string = uniqueString('sql', resourceGroup().id)

param sqlDBName string = 'sqlDB'

param location string = resourceGroup().location

param adminUserName string


@secure()
param adminPassword string

param vnet1ID string
// param vnet1Subnet3ID string

// param vnet2ID string

// param nsg4Name string
var privateEndpointName = 'privateEndpointWebApp'


resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: vnet1ID
}

// resource vnet2 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
//   name: vnet2ID
// }

param privateDnsZoneName string = 'privatelink.sql.database.azure.com'


resource sqlServer 'Microsoft.Sql/servers@2021-11-01' = {
  name: serverName
  location: location
  // sku: {
  //   name: 'GP_Gen5_2'
  //   tier: 'GeneralPurpose'
  //   capacity: 2
  //   family: 'Gen5'
  // }
  properties: {
    // minimalTlsVersion: '1.2'
    // publicNetworkAccess: 'Enabled'
    // version: '12.0'
    administratorLogin: adminUserName
    administratorLoginPassword: adminPassword
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2021-11-01' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  // sku: {
  //   name: 'Standard'
  //   size: 'S0' 
  //   tier: 'Standard'
  // }
}

resource sqlVirtualNetworkRules 'Microsoft.Sql/servers/virtualNetworkRules@2021-11-01' = {
  parent: sqlServer
  name: 'sqlVirtualNetworkRulesManagement'
  properties: {
    ignoreMissingVnetServiceEndpoint: true
    virtualNetworkSubnetId: vnet1.properties.subnets[0].id
  }
}


resource privateEndpoint 'Microsoft.Network/privateEndpoints@2022-11-01' = {
  name: privateEndpointName
  location: location
  properties: {
    subnet: {
      id: vnet1.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'webAppprivateLinkServiceConnection'
        properties: {
          privateLinkServiceId: sqlServer.id
          groupIds: [
            'sqlServer'
          ]
        }
      }
    ]
  }
  dependsOn: [
    vnet1
  ]
}


resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {
  name: privateDnsZoneName
  location: 'global'
  dependsOn: [
    vnet1
  ]
}

resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name:  '${privateDnsZoneName}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet1.id
    }
  }
}

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: 'privateDnsZoneGroup/privateEndpoint'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDnsZone.id
        }
      }
    ]
  }
  dependsOn: [
    privateEndpoint
  ]
}



output sqlServerName string = sqlServer.name
output sqlServerID string = sqlServer.id
output sqlDBName string = sqlDB.name
output sqlDBID string = sqlDB.id
output privateEndpointWebAppName string = privateEndpoint.name
output privateEndpointWebAppID string = privateEndpoint.id
output webPrivateLinkServiceConnectionsName string = privateEndpoint.properties.privateLinkServiceConnections[0].name
output webPrivateLinkServiceConnectionsID string = privateEndpoint.properties.privateLinkServiceConnections[0].id

