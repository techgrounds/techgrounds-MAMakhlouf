param location string = 'westeurope'

resource azurerm_virtual_network vnet1 'Microsoft.Network/virtualNetworks@2022-03-01' = {
  name: 'vnet1'
  location: location
  addressSpace: {
    addressPrefixes: [
      '10.0.0.0/16'
    ]
  }
}

resource azurerm_subnet subnet1 'Microsoft.Network/virtualNetworks/subnets@2022-03-01' = { 
  name: 'subnet1'
  parent: vnet1
  addressPrefix: '10.0.0.0/24'
}

resource azurerm_availability_set availabilitySet1 'Microsoft.Compute/availabilitySets@2022-03-01' = {
  name: 'availabilitySet1'
  location: location
  platformFaultDomainCount: 2
  platformUpdateDomainCount: 2
}

resource azurerm_virtual_machine webServer '2022-03-01' = {
  name: 'webServer'
  location: location
  availabilitySet: {
    id: availabilitySet1.id
  }
  hardwareProfile: {
    vmSize: 'Standard_DS2_v2'
  }
  osProfile: {
    computerName: 'webServer'
    adminUsername: 'adminUser'
    adminPassword: 'adminPassword'
  }
  networkProfile: {
    networkInterfaces: [
      {
        id: webServerNic.id
      }
    ]
  }
}

resource azurerm_network_security_group webServerNsg '2022-03-01' = {
  name: 'webServerNsg'
  location: location
  securityRules: [
    {
      name: 'HTTP'
      priority: 100
      direction: 'Inbound'
      access: 'Allow'
      protocol: 'Tcp'
      sourceAddressPrefix: '*'
      sourcePortRange: '*'
      destinationAddressPrefix: '*'
      destinationPortRange: '80'
    },
    {
      name: 'SSH'
      priority: 200
      direction: 'Inbound'
      access: 'Allow'
      protocol: 'Tcp'
      sourceAddressPrefix: '10.0.0.0/16'
      sourcePortRange: '*'
      destinationAddressPrefix: '*'
      destinationPortRange: '22'
    },
    {
      name: 'RDP'
      priority: 201
      direction: 'Inbound'
      access: 'Allow'
      protocol: 'Tcp'
      sourceAddressPrefix: '10.0.0.0/16'
      sourcePortRange: '*'
      destinationAddressPrefix: '*'
      destinationPortRange: '3389'
    }
  ]
}

resource azurerm_network_interface webServerNic '2022-03-01' = {
  name: 'webServerNic'
  location: location
  ipConfigurations: [
    {
      name: 'webServerIpConfig'
      subnet: {
        id: subnet1.id
      }
      privateIpAddressAllocation: 'Dynamic'
      publicIpAddress: {
        id: webServerPublicIp.id
      }
    }
  ]
}

resource azurerm_public_ip_address webServerPublicIp '2022-03-01' = {
  name: 'webServerPublicIp'
  location: location
  allocationMethod: 'Static'
}

resource azurerm_virtual_machine managementServer '2022-03-01' = {
  name: 'managementServer'
  location: location
  availabilitySet: {
    id: availabilitySet1.id
  }
  hardwareProfile: {
    vmSize: 'Standard_DS2_v2'
  }
  osProfile: {
    computerName: 'managementServer'
    adminUsername: 'adminUser'
    adminPassword: 'adminPassword'
  }
  networkProfile: {
    networkInterfaces: [
      {
        id: managementServerNic.id
      }
    ]
  }
}

resource azurerm_network_interface managementServerNic '2022-03-01' = {
  name: 'managementServerNic'
  location: location
  ipConfigurations: [
    {
      name: 'managementServerIpConfig'
      subnet: {
        id: subnet1.id
      }
      privateIpAddressAllocation: 'Dynamic'
      publicIpAddress: {
        id: managementServerPublicIp.id
      }
    }
  ]
}

resource azurerm_public_ip_address managementServerPublicIp '2022-03-01' = {
  name: 'managementServerPublicIp'
  location: location
  allocationMethod: 'Static'
}

output webServerPublicIpAddress string = webServerPublicIp.ipAddress
output managementServerPublicIpAddress string = managementServerPublicIp.ipAddress
