param location string = resourceGroup().location
param backupVaultName string = 'myBackupVault'

resource backupVault 'Microsoft.RecoveryServices/vaults@2023-02-01' = {
  name: backupVaultName
  location: location
   sku: {
      name: 'RS0'
    }
    // backupStorageRedundancy: 'LocallyRedundant'
    // encryption: {
    //   enabled: true
    // }
  properties: {
   
    // Configure backup policies and protected items
  }


}
