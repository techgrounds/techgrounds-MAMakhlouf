param webServerName string = 'webserver'
@secure()
param adminUserName string 
@secure()
param adminPassword string 
param location string = resourceGroup().location

resource webServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: webServerName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize:  'Standard_B1s'
    }
    osProfile: {
      computerName: webServerName
      adminUsername: adminUserName
      adminPassword: adminPassword
    }
    storageProfile: {
       imageReference: {
        offer: 'UbuntuServer'
        publisher: 'Canonical'
        sku: '18.04-LTS'
        version: 'Latest'
      }
      osDisk: {
        createOption:  'FromImage'
        diskSizeGB: 32
        encryptionSettings: {
          enabled: false
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

resource webServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: '${webServerName}-publicip'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // Add IP restriction rule for trusted locations
  }
}
