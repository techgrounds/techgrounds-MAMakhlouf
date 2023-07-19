param location string = resourceGroup().location

@secure()
param adminUserName string

@secure()
param adminPassword string

param webServerName string = 'webServerScaleSet'

param vnet1ID string
param vnet1Subnet1ID string
// param vnet1Subnet2ID string
param nsg1Id string
// param nsg3Id string
param diskencryption string
param ciphers array = [
  'TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384'
  'TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256'
  'TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384'
  'TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256'
]
resource vnet1 'Microsoft.Network/virtualNetworks@2022-11-01' existing = {
  name: vnet1ID
}

resource appGate 'Microsoft.Network/applicationGateways@2022-11-01' = {
  name: 'appGate'
  location: location
  tags: {
    Location: location
  }
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
      capacity: 1
    }
    sslCertificates: [
      {
        name:'SSLcertificat'
        properties:{
          data: loadFileAsBase64('selfSignedCertificate.pfx')
          password:'1234'

        }
      }
    ]
    sslPolicy:{
      policyType: 'Custom'
      minProtocolVersion: 'TLSv1_2'
      cipherSuites: ciphers
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: vnet1.properties.subnets[1].id
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGatewayFrontendIP'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id:  webServerPublicIP.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'appGatewayFrontendPort'
        properties: {
          port: 80
        }
      }
    {   name:'appGatewayFrontendPortHttps'
        properties: {
          port: 443
        }
  }
    ]
    backendAddressPools: [
      {
        name: 'appGatewayBackendPool'
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'appGatewayBackendHttpSettings'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          requestTimeout: 20
        }
      }
    ]
    redirectConfigurations: [
      {
        name:'appGatewayRedirect'
        properties: {
          redirectType: 'Permanent'
          targetListener: {
          id: resourceId('Microsoft.Network/applicationGateways/httpListeners', 'appGate', 'appGatewayHttpsListener')
          }
        }
      }
    ]
    httpListeners: [
      {
        name: 'appGatewayHttpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', 'appGate', 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', 'appGate', 'appGatewayFrontendPort')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
      {
        name: 'appGatewayHttpsListener'
        properties: {
          frontendIPConfiguration:{
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', 'appGate', 'appGatewayFrontendIP')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', 'appGate', 'appGatewayFrontendPortHttps')
          }
          protocol: 'Https'
          requireServerNameIndication: false
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates', 'appGate', 'SSLcertificat')
          }
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'appGatewayHttpRule'
        properties: {
          priority: 1
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', 'appGate', 'appGatewayHttpListener')
          }
          redirectConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/redirectConfigurations', 'appGate', 'appGatewayRedirect')
          }
          // backendAddressPool: {
          //   id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', 'appGate', 'appGatewayBackendPool')
          // }
          // backendHttpSettings: {
          //   id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', 'appGate', 'appGatewayBackendHttpSettings')
          // }
        }
      }
      {
        name: 'appGatewayHttpsRule'
        properties: {
          ruleType: 'Basic'
          priority: 10
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', 'appGate', 'appGatewayHttpsListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', 'appGate', 'appGatewayBackendPool')
          }
           backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', 'appGate', 'appGatewayBackendHttpSettings')
          }
        }
      }
    ]
  enableHttp2: false
    }
    dependsOn: [
      vnet1
    ]
  }

resource webServerScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: webServerName
  location: location
  tags: {
    Location: location
  }
  sku: {
    capacity: int(1)
    name: 'Standard_B1s'
    tier: 'Standard'
  }
  properties: {
    overprovision: true
    upgradePolicy: {
      mode: 'Automatic'
    }
    singlePlacementGroup: true
    platformFaultDomainCount: 1
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: 'StandardSSD_ZRS'
            diskEncryptionSet: {
              id: diskencryption
            }
          }
        }
        imageReference: {
          publisher: 'Canonical'
          offer: '0001-com-ubuntu-server-jammy'
          sku: '22_04-lts-gen2'
          version: 'latest'
        }
      }
      osProfile: {
        computerNamePrefix: 'ScaleSetVM'
        adminUsername: adminUserName
        adminPassword: adminPassword
        customData: loadFileAsBase64('apacheserver.sh')
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: 'WebScaleNiconfig'
            properties: {
              primary: true 
              enableAcceleratedNetworking: false
              enableIPForwarding: false
              networkSecurityGroup: {
                id: nsg1Id
              }
              ipConfigurations: [
                {
                  name: 'ipConfigScaleSet'
                  properties: {
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet1ID, vnet1Subnet1ID)
                    }
                    privateIPAddressVersion: 'IPv4'
                    applicationGatewayBackendAddressPools: [
                       {
                         id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', 'appGate', 'appGatewayBackendPool')
                       }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
      extensionProfile: {
        extensions: [
          {
            name: 'vmScaleHealth'
            properties: {
              enableAutomaticUpgrade: true
              autoUpgradeMinorVersion: false
              publisher: 'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              typeHandlerVersion:'1.0'
              settings: {
                port: 80
                protocol: 'http'
                requestPath: ''
              }
            }
          }
        ]
      }
    }
    //   automaticRepairsPolicy: {
    //   enabled: true
    //   repairAction: 'Replace'
    //   gracePeriod: 'PT10M'
    // }
  }
  dependsOn: [
    appGate
  ]
}



//A public IP for application gateway.
resource webServerPublicIP 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: 'webServerpublicIP'
  location: location
  sku: {
    name: 'Standard'
  }
  tags: {
    Location: location
  }
  properties: {
    publicIPAddressVersion: 'IPv4'
    publicIPAllocationMethod: 'Static'
    idleTimeoutInMinutes: 4
    dnsSettings: {
      domainNameLabel: 'webserverscaleset'
    }
  }
}

@description('Autoscaling resource for the vmss')
resource autoScaleResource 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'webServerAutoScale'
  location: location
  properties: {
    name: 'webServerAutoScale'
    targetResourceUri: webServerScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: webServerScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT${10}M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 75
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT1M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricNamespace: ''
              metricResourceUri: webServerScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 25
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT1M'
            }
          }
        ]
      }
    ]
    predictiveAutoscalePolicy: {
      scaleMode: 'ForecastOnly'
      scaleLookAheadTime: 'PT14M'
    }
  }
}
