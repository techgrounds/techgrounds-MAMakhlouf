

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
          id: webServerNic.id
        }
      ]
    }
  }
}
