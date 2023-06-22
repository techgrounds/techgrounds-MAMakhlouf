param keyVaultName string = '${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
param location string

@secure()
param adminUserName string
@secure()
param adminPassword string

// @description('The JsonWebKeyType of the key to be created.')
// param keyType string = 'RSA'

// @description('The size in bits of the key to be created.')
// param keySize int = 2048


resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enableRbacAuthorization: true
    tenantId: subscription().tenantId
    enableSoftDelete: true
    softDeleteRetentionInDays: 7
    // accessPolicies: [
    //   {
    //     tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
    //     objectId: 'd0b3e936-ee7b-4623-b30f-05ba6c67aaad' // Vervang 'YOUR_OBJECT_ID' door het object-ID van de juiste service principal of gebruiker die toegang moet hebben tot de Key Vault (bijvoorbeeld de service principal van je beheerde identiteit).
    //     permissions: {
    //       keys: [
    //         'all'
    //       ]
    //       secrets: ['all'
    //     ]
    //     }
    //   }
    // ]
    sku: {
      name: 'standard'
      family: 'A'
    }
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: [

      ]
      virtualNetworkRules: []
    }
  }
}


resource adminUserNameSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: '${keyVault.name}adminUserName'
  properties: {
    value: adminUserName
  }
}

resource adminPasswordSecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: '${keyVault.name}adminPassword'
  properties: {
    value: adminPassword
  }
}

output keyVaultName string = keyVault.name
output keyVaultSecretN string = adminUserNameSecret.id
output keyVaultSecretP string = adminPasswordSecret.id

