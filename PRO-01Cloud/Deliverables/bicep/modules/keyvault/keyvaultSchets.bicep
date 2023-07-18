param keyVaultName string = '${take(location, 6)}-vault${take(uniqueString(resourceGroup().id), 6)}'
param location string

// param vnet1ID string
// param vnet1Subnet1ID string
@secure() 
param adminUserName string

@secure()
param adminPassword string

param tenantID string = 'de60b253-74bd-4365-b598-b9e55a2b208d'

param vnet2ID string
param vnet2Subnet2ID string

param keyvault_key_name string = 'Sleutel'

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
    tenantId: tenantID
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: [{
        value: '213.10.190.55'
      }]
      virtualNetworkRules: [
        {
          id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet2ID, vnet2Subnet2ID)
          ignoreMissingVnetServiceEndpoint: false
        }
      ]
    }
    accessPolicies: [
      {
        tenantId: tenantID
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
    enablePurgeProtection: true
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
  }
  
}

resource managed_identity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name:  'managedID'
  location: location
}

resource kv_key_resource 'Microsoft.KeyVault/vaults/keys@2023-02-01' = {
  name: keyvault_key_name
  parent: keyVault
  properties: {
    attributes: {
      enabled: true
    }
    keySize: 2048              // Other possible values are 3072 or 4096
    kty: 'RSA'
    keyOps: [
      'encrypt'
      'decrypt'
      'sign'
      'verify'
      'wrapKey'
      'unwrapKey'
    ]
  }
}

resource disk_encryption 'Microsoft.Compute/diskEncryptionSets@2021-08-01' = {
  name: 'disk_encryption_sets'
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    // encryptionType: 'EncryptionAtRestWithCustomerKey'
    rotationToLatestKeyVersionEnabled: true
    activeKey: {
      keyUrl: kv_key_resource.properties.keyUriWithVersion
      sourceVault: {
        id: keyVault.id
      }
    }
  }
}

resource vault_access_policy 'Microsoft.KeyVault/vaults/accessPolicies@2021-10-01' = {
  name: 'add'
  parent: keyVault
  properties: {
    accessPolicies:[
      {
        tenantId: tenantID
        objectId: disk_encryption.identity.principalId
        permissions: {
          keys: [
            'get'
            'wrapKey'
            'unwrapKey'
            'encrypt'
            'decrypt'
          ]
          secrets: []
          certificates: []
        }
      }]
    }}
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
output diskencryptset_id string = disk_encryption.id
output kv_key_name string = kv_key_resource.name
