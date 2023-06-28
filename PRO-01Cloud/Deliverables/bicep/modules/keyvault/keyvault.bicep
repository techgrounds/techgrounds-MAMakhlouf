param keyVaultName string = '${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
param location string

// param vnet1ID string
// param vnet1Subnet1ID string
@secure() 
param adminUserName string

@secure()
param adminPassword string

param vnet2ID string
param vnet2Subnet2ID string

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  // tags: {
  //   tagName1: 'tagValue1'
  //   tagName2: 'tagValue2'
  // }
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
          id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet2ID, vnet2Subnet2ID)
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
        objectId: 'f1b7c5e5-3b7e-4b1c-8f5c-2b9b0b4b6b6b'
        permissions: {
          keys: [
            'all'
          ]
          secrets: [
            'all'
          ]
          certificates: [
            'all'
          ]
          storage: [
            'all'
          ]
        }
      }
    ]
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    enableRbacAuthorization: false
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
  
}

resource adminLogin 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'adminUserName'
  properties: {
    value: adminUserName
  }
}

resource adminPswd 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'adminPassword'
  properties: {
    value: adminPassword
  }
}

output keyVaultName string = keyVault.name
output keyVaultID string = keyVault.id
output keyVaultUri string = keyVault.properties.vaultUri
