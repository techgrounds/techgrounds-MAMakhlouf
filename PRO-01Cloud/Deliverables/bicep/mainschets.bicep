param location string = 'westeurope'
param vnet1Name string = 'app-prd-vnet'
param vnet2Name string = 'management-prd-vnet'
param subnet1Name string = 'app-prd-subnet'
param subnet2Name string = 'managemen-prd-subnet'
param webServerName string = 'webserver'
param managementServerName string = 'managementserver'
param nsg1Name string = 'app-prd-nsg'
param nsg2Name string = 'management-prd-nsg'
param keyVaultName string = 'keyvault'
param storageAccountName string = 'storageaccount'
param backupVaultName string = 'backupvault'
param adminUserName string = 'akram'
@secure()
param adminPassword string = newGuid()

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

resource webServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: webServerName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS2_v2'
    }
    osProfile: {
      computerName: webServerName
      adminUsername: adminUserName
      adminPassword: 'akram020'
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        diskSizeGB: 128
        encryptionSettings: {
          enabled: true
        }
      }
      dataDisks: []
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: webServerNic.id
        }
      ]
    }
  }
}

resource managementServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: managementServerName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_DS2_v2'
    }
    osProfile: {
      computerName: managementServerName
      adminUsername: adminUserName
      adminPassword: adminPassword
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        diskSizeGB: 128
        encryptionSettings: {
          enabled: true
        }
      }
      dataDisks: []
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: managementServerNic.id
        }
      ]
    }
  }
}

resource webServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: '${webServerName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          subnet: {
            id: subnet1.id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: webServerPublicIP.id
          }
        }
      }
    ]
  }
}

resource managementServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: '${managementServerName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          subnet: {
            id: subnet2.id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: managementServerPublicIP.id
          }
        }
      }
    ]
  }
}

resource webServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: '${webServerName}-publicip'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // Add IP restriction rule for trusted locations
  }
}

resource managementServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: '${managementServerName}-publicip'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // Add IP restriction rule for trusted locations
  }
}

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: { 
    sku: {
      name: 'standard'
    }
    accessPolicies: [
      // Define access policies for key vault
    ]
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  properties: {
    kind: 'StorageV2'
    sku: {
      name: 'Standard_LRS'
    }
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}

resource backupVault 'Microsoft.RecoveryServices/vaults@2023-02-01' = {
  name: backupVaultName
  location: location
  properties: {
    sku: {
      name: 'RS0'
    }
    backupStorageRedundancy: 'LocallyRedundant'
    encryption: {
      enabled: true
    }
    // Configure backup policies and protected items
  }
}
