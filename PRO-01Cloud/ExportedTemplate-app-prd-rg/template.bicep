param vaults_keyVault_app_prd_name string = 'keyVault-app-prd'
param virtualMachines_webServer_name string = 'webServer'
param virtualMachines_adminserver_name string = 'adminserver'
param virtualNetworks_westeu_vnet1_name string = 'westeu-vnet1'
param virtualNetworks_westeu_vnet2_name string = 'westeu-vnet2'
param networkInterfaces_webServer_nic_name string = 'webServer-nic'
param networkInterfaces_adminserver_nic_name string = 'adminserver-nic'
param publicIPAddresses_webServer_publicip_name string = 'webServer-publicip'
param networkSecurityGroups_westeu_vnet1_nsg_name string = 'westeu-vnet1-nsg'
param networkSecurityGroups_westeu_vnet2_nsg_name string = 'westeu-vnet2-nsg'
param publicIPAddresses_adminserver_publicip_name string = 'adminserver-publicip'

resource networkSecurityGroups_westeu_vnet1_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: networkSecurityGroups_westeu_vnet1_nsg_name
  location: 'westeurope'
  tags: {
    Location: 'westeurope'
  }
  properties: {
    securityRules: [
      {
        name: 'https'
        id: networkSecurityGroups_westeu_vnet1_nsg_name_https.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '443'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 100
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
      {
        name: 'ssh'
        id: networkSecurityGroups_westeu_vnet1_nsg_name_ssh.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 101
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource networkSecurityGroups_westeu_vnet2_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2022-11-01' = {
  name: networkSecurityGroups_westeu_vnet2_nsg_name
  location: 'westeurope'
  tags: {
    Location: 'westeurope'
  }
  properties: {
    securityRules: [
      {
        name: 'ssh'
        id: networkSecurityGroups_westeu_vnet2_nsg_name_ssh.id
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 200
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource publicIPAddresses_adminserver_publicip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_adminserver_publicip_name
  location: 'westeurope'
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '108.142.160.133'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Dynamic'
    idleTimeoutInMinutes: 4
    dnsSettings: {
      domainNameLabel: 'ljjkr7awsznzu'
      fqdn: 'ljjkr7awsznzu.westeurope.cloudapp.azure.com'
    }
    ipTags: []
  }
}

resource publicIPAddresses_webServer_publicip_name_resource 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddresses_webServer_publicip_name
  location: 'westeurope'
  sku: {
    name: 'Basic'
    tier: 'Regional'
  }
  properties: {
    ipAddress: '108.142.160.162'
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Dynamic'
    idleTimeoutInMinutes: 4
    dnsSettings: {
      domainNameLabel: 'a5j32d7shofoi'
      fqdn: 'a5j32d7shofoi.westeurope.cloudapp.azure.com'
    }
    ipTags: []
  }
}

resource virtualMachines_adminserver_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_adminserver_name
  location: 'westeurope'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    storageProfile: {
      imageReference: {
        publisher: 'MicrosoftWindowsServer'
        offer: 'WindowsServer'
        sku: '2022-Datacenter'
        version: 'Latest'
      }
      osDisk: {
        osType: 'Windows'
        encryptionSettings: {
          enabled: false
        }
        name: '${virtualMachines_adminserver_name}_OsDisk_1_857ffe7fefc042d5b993688851d53988'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_adminserver_name}_OsDisk_1_857ffe7fefc042d5b993688851d53988')
        }
        deleteOption: 'Detach'
        diskSizeGB: 127
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_adminserver_name
      adminUsername: 'AkramAkram'
      windowsConfiguration: {
        provisionVMAgent: true
        enableAutomaticUpdates: true
        patchSettings: {
          patchMode: 'AutomaticByOS'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_adminserver_nic_name_resource.id
        }
      ]
    }
  }
}

resource virtualMachines_webServer_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_webServer_name
  location: 'westeurope'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'Latest'
      }
      osDisk: {
        osType: 'Linux'
        encryptionSettings: {
          enabled: false
        }
        name: '${virtualMachines_webServer_name}_OsDisk_1_ddda3fad59bf4a5c98daef89e2073fed'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'Premium_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_webServer_name}_OsDisk_1_ddda3fad59bf4a5c98daef89e2073fed')
        }
        deleteOption: 'Detach'
        diskSizeGB: 32
      }
      dataDisks: []
    }
    osProfile: {
      computerName: virtualMachines_webServer_name
      adminUsername: 'AkramAkram'
      linuxConfiguration: {
        disablePasswordAuthentication: false
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_webServer_nic_name_resource.id
        }
      ]
    }
  }
}

resource vaults_keyVault_app_prd_name_resource 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: vaults_keyVault_app_prd_name
  location: 'westeurope'
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: []
      virtualNetworkRules: [
        {
          id: virtualNetworks_westeu_vnet2_name_virtualNetworks_westeu_vnet2_name_subnet1.id
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: []
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    enableRbacAuthorization: true
    vaultUri: 'https://keyvault-app-prd.vault.azure.net/'
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
}

resource networkSecurityGroups_westeu_vnet1_nsg_name_https 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_westeu_vnet1_nsg_name}/https'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '443'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 100
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_westeu_vnet1_nsg_name_resource
  ]
}

resource networkSecurityGroups_westeu_vnet1_nsg_name_ssh 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_westeu_vnet1_nsg_name}/ssh'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 101
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_westeu_vnet1_nsg_name_resource
  ]
}

resource networkSecurityGroups_westeu_vnet2_nsg_name_ssh 'Microsoft.Network/networkSecurityGroups/securityRules@2022-11-01' = {
  name: '${networkSecurityGroups_westeu_vnet2_nsg_name}/ssh'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 200
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_westeu_vnet2_nsg_name_resource
  ]
}

resource virtualNetworks_westeu_vnet2_name_resource 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: virtualNetworks_westeu_vnet2_name
  location: 'westeurope'
  tags: {
    Location: 'westeurope'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.20.0/24'
      ]
    }
    subnets: [
      {
        name: '${virtualNetworks_westeu_vnet2_name}-subnet1'
        id: virtualNetworks_westeu_vnet2_name_virtualNetworks_westeu_vnet2_name_subnet1.id
        properties: {
          addressPrefix: '10.10.20.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_westeu_vnet2_nsg_name_resource.id
          }
          serviceEndpoints: [
            {
              service: 'Microsoft.KeyVault'
              locations: [
                '*'
              ]
            }
          ]
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}

resource networkInterfaces_adminserver_nic_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_adminserver_nic_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfigAdminServer'
        id: '${networkInterfaces_adminserver_nic_name_resource.id}/ipConfigurations/ipconfigAdminServer'
        etag: 'W/"a5fad8ee-704c-4a49-96e3-4b6eb52240b4"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.10.20.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_adminserver_publicip_name_resource.id
          }
          subnet: {
            id: virtualNetworks_westeu_vnet2_name_virtualNetworks_westeu_vnet2_name_subnet1.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    nicType: 'Standard'
  }
}

resource networkInterfaces_webServer_nic_name_resource 'Microsoft.Network/networkInterfaces@2022-11-01' = {
  name: networkInterfaces_webServer_nic_name
  location: 'westeurope'
  kind: 'Regular'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfigWebServer'
        id: '${networkInterfaces_webServer_nic_name_resource.id}/ipConfigurations/ipconfigWebServer'
        etag: 'W/"3cba69db-09d9-48fc-a712-6aff85f58918"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          provisioningState: 'Succeeded'
          privateIPAddress: '10.10.10.4'
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddresses_webServer_publicip_name_resource.id
          }
          subnet: {
            id: virtualNetworks_westeu_vnet1_name_virtualNetworks_westeu_vnet1_name_subnet1.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    nicType: 'Standard'
  }
}

resource virtualNetworks_westeu_vnet1_name_resource 'Microsoft.Network/virtualNetworks@2022-11-01' = {
  name: virtualNetworks_westeu_vnet1_name
  location: 'westeurope'
  tags: {
    Location: 'westeurope'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
    subnets: [
      {
        name: '${virtualNetworks_westeu_vnet1_name}-subnet1'
        id: virtualNetworks_westeu_vnet1_name_virtualNetworks_westeu_vnet1_name_subnet1.id
        properties: {
          addressPrefix: '10.10.10.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_westeu_vnet1_nsg_name_resource.id
          }
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: [
      {
        name: '${virtualNetworks_westeu_vnet1_name}-westeu-vnet2'
        id: virtualNetworks_westeu_vnet1_name_virtualNetworks_westeu_vnet1_name_westeu_vnet2.id
        properties: {
          peeringState: 'Initiated'
          peeringSyncLevel: 'RemoteNotInSync'
          remoteVirtualNetwork: {
            id: virtualNetworks_westeu_vnet2_name_resource.id
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          doNotVerifyRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.10.20.0/24'
            ]
          }
          remoteVirtualNetworkAddressSpace: {
            addressPrefixes: [
              '10.10.20.0/24'
            ]
          }
        }
        type: 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings'
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualNetworks_westeu_vnet1_name_virtualNetworks_westeu_vnet1_name_subnet1 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_westeu_vnet1_name}/${virtualNetworks_westeu_vnet1_name}-subnet1'
  properties: {
    addressPrefix: '10.10.10.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_westeu_vnet1_nsg_name_resource.id
    }
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_westeu_vnet1_name_resource

  ]
}

resource virtualNetworks_westeu_vnet2_name_virtualNetworks_westeu_vnet2_name_subnet1 'Microsoft.Network/virtualNetworks/subnets@2022-11-01' = {
  name: '${virtualNetworks_westeu_vnet2_name}/${virtualNetworks_westeu_vnet2_name}-subnet1'
  properties: {
    addressPrefix: '10.10.20.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_westeu_vnet2_nsg_name_resource.id
    }
    serviceEndpoints: [
      {
        service: 'Microsoft.KeyVault'
        locations: [
          '*'
        ]
      }
    ]
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_westeu_vnet2_name_resource

  ]
}

resource virtualNetworks_westeu_vnet1_name_virtualNetworks_westeu_vnet1_name_westeu_vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2022-11-01' = {
  name: '${virtualNetworks_westeu_vnet1_name}/${virtualNetworks_westeu_vnet1_name}-westeu-vnet2'
  properties: {
    peeringState: 'Initiated'
    peeringSyncLevel: 'RemoteNotInSync'
    remoteVirtualNetwork: {
      id: virtualNetworks_westeu_vnet2_name_resource.id
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    doNotVerifyRemoteGateways: false
    remoteAddressSpace: {
      addressPrefixes: [
        '10.10.20.0/24'
      ]
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        '10.10.20.0/24'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_westeu_vnet1_name_resource

  ]
}