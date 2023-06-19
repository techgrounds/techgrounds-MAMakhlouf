resource azset 'Microsoft.Compute/availabilitySets@2023-03-01' = {
  name: 'azet'
  location: location
  sku: {
    name: 'Alligned'
  }
  properties: {
    platformFaultDomainCount: 2
    platformUpdateDomainCount: 5
  }
}

resource webServerPublicIp 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: 'webServerPublicIp'
  location: location
  properties:{
     publicIPAllocationMethod: 'Static'
  }
}

resource webServerNic 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: 'webServerNic'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'webServerIpConfig'
        subnet: {
        id: subnetapp.id
        }
        privateIpAddressAllocation: 'Dynamic'
        publicIpAddress: { 
        id: webServerPublicIp.id
        }
      }
    ]
  }
}



resource webserver 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: 'webserver'
  location: location
  properties: {
    availabilitySet:{
      id: azset.id
    }
    hardwareProfile: {
      vmSize: 'Standard_B1s'
    }
    osProfile: {
      computerName: 'webServer'
      adminUsername: 'akram'
      adminPassword: 'akram020'
      }
    networkProfile: {
      networkInterfaces: [
      webServerNic
      ]
    }
   
    }
  }

resource WebServerNsg 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: 'webServerNsg'
  location: location
  properties: {
    securityRules: [
      {
        name: 'HTTP'
        priority: 100
        direction: 'inbound'
        acces: 'allow'
        protocol: 'tcp'
        sourceAddressPrefix: '*'
        destinationAddressPrefix: '*'
        destinationPortRange: '80'
      }
      {
        name: 'SSH'
        priority: 200
        direction: 'Inbound'
        access: 'Allow'
        protocol: 'Tcp'
        sourceAddressPrefix: vnet1IPRange
        sourcePortRange: '*'
        destinationAddressPrefix: '*'
        destinationPortRange: '22'
      }
      {
        name: 'RDP'
        priority: 201
        direction: 'inbound'
        acces: 'allow'
        protocol: 'tcp'
        sourceAddressPrefic: vnet1IPRange
        sourcePortRange: '*'
        destinationAddressPrefix: '*'
        destinationPortRange: '3389'
      }
    ]
  }
}
