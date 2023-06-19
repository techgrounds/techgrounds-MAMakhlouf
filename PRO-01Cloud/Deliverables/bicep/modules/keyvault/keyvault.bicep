param location string = resourceGroup().location
param keyVaultName string = 'keyvault'

resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: { 
    sku: {
      name: 'standard'
    }
    accessPolicies: [
      // Define access policies for key vault
    ]
  }
}
