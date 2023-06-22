param managementServerName string = 'adminserver'
param location string = resourceGroup().location

@secure()
param adminUserName string 
@secure()
param adminPassword string 

// param azSetID string
param vnet2ID string
param vnet2Subnet2ID string
// param keyVaultName string

// resource adminUserNameSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' existing = {
//   name: '${keyVaultName}adminUserName'
// }

resource managementServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: managementServerName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    // availabilitySet: {
    //   id: azSetID
    // }
    hardwareProfile: {
      vmSize:  'Standard_B2s'
    }
    osProfile: {
      computerName: managementServerName
      adminUsername: adminUserName
      adminPassword: adminPassword 
      windowsConfiguration: {
        enableAutomaticUpdates: true
      }
    }
    storageProfile: {
      imageReference: {
        offer: 'WindowsServer'
        publisher: 'MicrosoftWindowsServer'
        sku: '2022-Datacenter'
        version: 'Latest'
      }
      osDisk: {
        createOption:  'FromImage'
        diskSizeGB: null
         osType: 'Windows'
        encryptionSettings: {
          enabled: false
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



resource managementServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: '${managementServerName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfigAdminServer'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet2ID, vnet2Subnet2ID)
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


resource managementServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: '${managementServerName}-publicip'
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // Add IP restriction rule for trusted locations
  dnsSettings: {
    domainNameLabel: uniqueString(managementServerName)
    }  
  }
}
