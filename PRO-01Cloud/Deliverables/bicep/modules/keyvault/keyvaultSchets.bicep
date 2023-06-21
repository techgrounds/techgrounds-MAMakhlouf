param keyVaultName string = '${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
param location string

param vnet1ID string
param vnet2ID string
param vnet1Subnet1ID string
param vnet2Subnet2ID string

resource keyVault 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: keyVaultName
  location: location
  // tags: {
  //   tagName1: 'tagValue1'
  //   tagName2: 'tagValue2'
  // }
  properties: {
    accessPolicies: [
      {
        applicationId: 'string'
        objectId: 'd0b3e936-ee7b-4623-b30f-05ba6c67aaad'
        permissions: {
          certificates: [
            'all'
          ]
          keys: [
            'all'
          ]
          secrets: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
        tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
      }
    ]
    createMode: 'string'
    enabledForDeployment: bool
    enabledForDiskEncryption: bool
    enabledForTemplateDeployment: bool
    enablePurgeProtection: bool
    enableRbacAuthorization: bool
    enableSoftDelete: bool
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: [
        {
          value: ['10.10.10.0/24', '10.20.20.0/24']
        }
      ]
      virtualNetworkRules: [
        {
          id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet2ID, vnet2Subnet2ID)
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    provisioningState: 'string'
    publicNetworkAccess: 'string'
    sku: {
      family: 'A'
      name: 'string'
    }
    softDeleteRetentionInDays: int
    tenantId: 'string'
    vaultUri: 'string'
  }
}
