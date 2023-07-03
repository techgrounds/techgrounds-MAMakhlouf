param location string = resourceGroup().location

@secure()
param adminUserName string

@secure()
param adminPassword string

param vnet1ID string
param vnet1Subnet1ID string
//param diskEncryptionSetName string




resource webServerScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: 'webServerScaleSet'
  location: location
  tags: {
    Location: location
  }
  sku: {
    capacity: int(1)
    name: 'Standard_B2s'
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
            storageAccountType: 'StandardSSD_LRS'
            // diskEncryptionSet: {
            //   id: diskEncryptionSet.id
            // }
          }
        }
        imageReference: {
          publisher: 'Canonical'
          offer: 'UbuntuServer'
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
            name: 'WebScaleNic'
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: 'ipConfigScaleSet'
                  properties: {
                    subnet: {
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet1ID, vnet1Subnet1ID)
                    }
                    applicationGatewayBackendAddressPools: [
                      
                    ]
                    
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
  dependsOn: [
    
  ]
}

//A public IP for the load balancer.
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
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: 'webServerScaleSet'
    }
  }
}

// Autoscaling resource for the vmss
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
