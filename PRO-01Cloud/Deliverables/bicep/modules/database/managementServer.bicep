param managementServerName string = 'managementserver'
param location string = resourceGroup().location

@secure()
param adminUserName string 
@secure()
param adminPassword string 

param subnet2ResourceId string

resource managementServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: managementServerName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    availabilitySet: {
      id: //availabilitySetResource.id
    }
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
        sku: '2019-Datacenter'
        version: 'Latest'
      }
      osDisk: {
        createOption:  'FromImage'
        diskSizeGB: 32
         osType: 'windows'
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



resource managementServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: '${managementServerName}-nic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig'
        properties: {
          subnet: {
            id: subnet2ResourceId
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
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // Add IP restriction rule for trusted locations
  }
}
