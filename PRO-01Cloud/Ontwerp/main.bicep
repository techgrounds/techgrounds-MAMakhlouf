param location string = 'westeurope'
param adminUser string
param adminSourceIPs array = [
  '10.10.10.0/24'
  '10.20.20.0/24'
]

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'myVNet'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
  }
}

resource adminSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  name: 'adminSubnet'
  parent: vnet
  properties: {
    addressPrefix: '10.0.0.0/24'
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Disabled'
    serviceEndpoints: [
      {
        service: 'Microsoft.Storage'
        locations: [
          '*'
        ]
      }
    ]
  }
}

resource webSubnet 'Microsoft.Network/virtualNetworks/subnets@2021-05-01' = {
  name: 'webSubnet'
  parent: vnet
  properties: {
    addressPrefix: '10.0.1.0/24'
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Disabled'
  }
}

resource webServerNIC 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: 'webServerNIC'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'webServerIPConfig'
        properties: {
          subnet: {
            id: webSubnet.id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

resource adminServerNIC 'Microsoft.Network/networkInterfaces@2021-05-01' = {
  name: 'adminServerNIC'
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'adminServerIPConfig'
        properties: {
          subnet: {
            id: adminSubnet.id
          }
          privateIPAllocationMethod: 'Dynamic'
        }
      }
    ]
  }
}

resource webServer 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: 'webServer'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: []
    }
    osProfile: {
      computerName: 'webServer'
      adminUsername: 'adminUser'
      adminPassword: 'P@ssw0rd123!'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: webServerNIC.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: '[concat('https://', reference(resourceId('Microsoft.Storage/storageAccounts', 'bootdiagstorage'), '2019-06-01').primaryEndpoints.blob)]',
      }
    }
  }
  dependsOn: [
    webServerNIC
  ]
}

resource adminServer 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: 'adminServer'
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_D2s_v3'
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
      }
      dataDisks: []
    }
    osProfile: {
      computerName: 'adminServer'
      adminUsername: 'adminUser'
      adminPassword: 'P@ssw0rd123!'
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: adminServerNIC.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: '[concat('https://', reference(resourceId('Microsoft.Storage/storageAccounts', 'bootdiagstorage'), '2019-06-01').primaryEndpoints.blob)]'
      }
    }
  }
  dependsOn: [
    adminServerNIC
  ]
}

resource diskEncryptionSet 'Microsoft.Compute/diskEncryptionSets@2021-03-01' = {
  name: 'diskEncryptionSet'
  location: location
  properties: {
    activeKey: {
      sourceVault: {
        id: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.KeyVault/vaults/{keyVaultName}'
      }
      keyUrl: 'https://{keyVaultName}.vault.azure.net/keys/{keyName}/{keyVersion}'
    }
  }
}

resource vmExtension 'Microsoft.Compute/virtualMachines/extensions@2021-03-01' = {
  name: 'webServerExtension'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Extensions'
    type: 'CustomScript'
    typeHandlerVersion: '2.1'
    settings: {
      fileUris: [
        'https://example.com/install-webserver-script.sh'
      ]
      commandToExecute: 'bash install-webserver-script.sh'
    }
  }
  dependsOn: [
    webServer
  ]
}

resource backupVault 'Microsoft.RecoveryServices/vaults@2021-05-01' = {
  name: 'backupVault'
  location: location
  properties: {}
}

resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionPolicies@2021-05-01' = {
  name: 'backupPolicy'
  parent: backupVault
  properties: {
    backupManagementType: 'AzureIaasVM'
    workloadType: 'AzureVM'
    retentionPolicy: {
      dailySchedule: {
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
        startTime: '2018-06-01T06:00:00+00:00'
      }
    }
  }
}

resource backupProtection 'Microsoft.RecoveryServices/vaults/backupFabrics/protectionContainers/items/protectedItems@2021-05-01' = {
  name: 'backupProtection'
  parent: backupVault
  properties: {
    policyId: backupPolicy.id
    sourceResourceId: webServer.id
    protectedItemType: 'Microsoft.Compute/virtualMachines'
  }
  dependsOn: [
    webServer
  ]
}

resource webServerNSG 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'webServerNSG'
  location: location
  properties: {
    securityRules: [
      {
        name: 'SSHRule'
        properties: {
          description: 'Allow SSH from admin server'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: adminSourceIPs[0]
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      }
      {
        name: 'RDPRule'
        properties: {
          description: 'Allow RDP from admin server'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: adminSourceIPs[0]
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 101
          direction: 'Inbound'
        }
      }
    ]
  }
  dependsOn: [
    webSubnet
  ]
}

resource adminServerNSG 'Microsoft.Network/networkSecurityGroups@2021-05-01' = {
  name: 'adminServerNSG'
  location: location
  properties: {
    securityRules: [
      {
        name: 'SSHRule'
        properties: {
          description: 'Allow SSH from trusted IPs'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefixes: adminSourceIPs
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
        }
      },
      {
        name: 'RDPRule'
        properties: {
          description: 'Allow RDP from trusted IPs'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefixes: adminSourceIPs
          destinationAddressPrefix: 'VirtualNetwork'
          access: 'Allow'
          priority: 101
          direction: 'Inbound'
        }
      }
    ]
  }
  dependsOn: [
    adminSubnet
  ]
}

output webServerPublicIP string = webServer.properties.networkProfile.networkInterfaces[0].properties.ipConfigurations[0].properties.publicIPAddress.id
