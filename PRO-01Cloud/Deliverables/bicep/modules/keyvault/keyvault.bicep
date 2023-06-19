param keyVaultName string = '${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
param location string

@secure()
param adminUserName string
@secure()
param adminPassword string

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      name: 'standard'
      family: 'A'
    }
    softDeleteRetentionInDays: 90
    accessPolicies: [
      {
        tenantId: 'de60b253-74bd-4365-b598-b9e55a2b208d'
        objectId: 'd0b3e936-ee7b-4623-b30f-05ba6c67aaad' // Vervang 'YOUR_OBJECT_ID' door het object-ID van de juiste service principal of gebruiker die toegang moet hebben tot de Key Vault (bijvoorbeeld de service principal van je beheerde identiteit).
        permissions: {
          secrets: ['get', 'set']
        }
      }
    ]
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

