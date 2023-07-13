@description('The name of the SQL logical server.')
param serverName string = uniqueString('sql', resourceGroup().id)

@description('The name of the SQL Database.')
param sqlDBName string = 'sqlDB'

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param adminUserName string

@description('The administrator password of the SQL logical server.')
@secure()
param adminPassword string

param vnet1ID string
// param vnet1Subnet3ID string

// param vnet2ID string

// param nsg4Name string

var privateEndpointName = 'privateEndpointWebApp'
param dnsGroupName string = 'dnsGroupName'


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
    administratorLogin: adminUserName
    administratorLoginPassword: adminPassword
  }
}

resource sqlDB 'Microsoft.Sql/servers/databases@2021-11-01' = {
  parent: sqlServer
  name: sqlDBName
  location: location
  sku: {
    name: 'Standard'
    tier: 'Standard'
  }
}

resource sqlVirtualNetworkRules 'Microsoft.Sql/servers/virtualNetworkRules@2021-11-01' = {
  parent: sqlServer
  name: 'sqlVirtualNetworkRulesManagement'
  properties: {
    ignoreMissingVnetServiceEndpoint: true
    virtualNetworkSubnetId: vnet1.properties.subnets[0].id
  }
}


resource privateEndpointWebApp 'Microsoft.Network/privateEndpoints@2022-11-01' = {
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
          // requestMessage: {
          //   content: 'Please approve the private endpoint connection.'
          // }
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
  name: 'privateDnsZoneLink'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: vnet1.id
    }
  }
}

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2022-11-01' = {
  name: dnsGroupName
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
    privateEndpointWebApp
  ]
}

// var rule = [
//   {
//     Name: 'webServerFirewallRule'
//     StartIpAddress: '10.10.10.0'
//     EndIpAddress: '10.10.10.255'
//   }
//   {
//     Name: 'managementServerSqlFirewallRules'
//     StartIpAddress: '10.10.20.0'
//     EndIpAddress: '10.10.20.255'
//   }
// ]


// resource managementServerSqlFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-11-01' = {
//   name: 'MansqlFirewallRules'
//   parent: sqlServer
//   properties: {
//     endIpAddress: rule[1].EndIpAddress
//     startIpAddress: rule[1].StartIpAddress
//   }
//   dependsOn: [
//     sqlDB
//     privateEndpointManagement
//   ]
// }

// resource webServerFirewallRules 'Microsoft.Sql/servers/firewallRules@2021-11-01' = {
//   name: 'WebsqlFirewallRules'
//   parent: sqlServer
//   properties: {
//     endIpAddress: rule[0].EndIpAddress
//     startIpAddress: rule[0].StartIpAddress
//   }
//   dependsOn: [
//     sqlDB
//     privateEndpointWebApp
//   ]
// }

@description('The name of the SQL server.')
output sqlServerName string = sqlServer.name

// The ID of the SQL server.
@description('The ID of the SQL server.')
output sqlServerID string = sqlServer.id

// The name of the MySQL database.
@description('The name of the MySQL database.')
output mysqlDBName string = sqlDB.name

// The ID of the MySQL database.
@description('The ID of the MySQL database.')
output mysqlDBID string = sqlDB.id

// Private Endpoint for the SQL database in each VNet
@description('Name of the Private Endpoint for the SQL database in each VNet.')
output privateEndpointWebAppName string = privateEndpointWebApp.name

// ID of the Private Endpoint for the SQL database in each VNet
@description('ID of the Private Endpoint for the SQL database in each VNet.')
output privateEndpointWebAppID string = privateEndpointWebApp.id

// Name of the Private Link Service Connection for the web/app Private Endpoint
@description('Name of the Private Link Service Connection for the web/app Private Endpoint.')
output webPrivateLinkServiceConnectionsName string = privateEndpointWebApp.properties.privateLinkServiceConnections[0].name

// ID of the Private Link Service Connection for the web/app Private Endpoint
@description('ID of the Private Link Service Connection for the web/app Private Endpoint.')
output webPrivateLinkServiceConnectionsID string = privateEndpointWebApp.properties.privateLinkServiceConnections[0].id

