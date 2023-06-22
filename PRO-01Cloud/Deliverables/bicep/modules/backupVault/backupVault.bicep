resource backupVault 'Microsoft.RecoveryServices/vaults@2023-02-01' = {
  name: backupVaultName
  location: location
  properties: {
    sku: {
      name: 'RS0'
    }
    backupStorageRedundancy: 'LocallyRedundant'
    encryption: {
      enabled: true
    }
    // Configure backup policies and protected items
  }
}
