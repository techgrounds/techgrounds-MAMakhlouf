param managementServerName string = 'managementserver'
param location string = resourceGroup().location

@secure()
param adminUserName string 
@secure()
param adminPassword string 

resource managementServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: managementServerName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize:  'Standard_B1s'
    }
    osProfile: {
      computerName: managementServerName
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
         osType: 'Linux'
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


resource managementServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: '${managementServerName}-publicip'
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    // Add IP restriction rule for trusted locations
  }
}
