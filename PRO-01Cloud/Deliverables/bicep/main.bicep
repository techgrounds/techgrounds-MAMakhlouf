param location string = 'westeurope'
param vnet1Name string = 'app-prd-vnet'
param vnet2Name string = 'management-prd-vnet'
param subnet1Name string = 'app-prd-subnet'
param subnet2Name string = 'managemen-prd-subnet'
//param webServerName string = 'webserver'
//param managementServerName string = 'managementserver'
param nsg1Name string = 'app-prd-nsg'
param nsg2Name string = 'management-prd-nsg'
//param keyVaultName string = 'keyvault'
//param storageAccountName string = 'storageaccount'
//param backupVaultName string = 'backupvault'
//param adminUserName string = 'akram'
//@secure()
//param adminPassword string = newGuid()

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

resource nsg1 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: nsg1Name
  location: location
  properties: {
    securityRules: [
      // Define security rules for web server
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



