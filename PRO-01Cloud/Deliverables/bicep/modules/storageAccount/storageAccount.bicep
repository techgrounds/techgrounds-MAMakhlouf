param location string = resourceGroup().location
param storageAccountName string = 'storageAcc${uniqueString(resourceGroup().id)}'



resource storageAcount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_ZRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}
