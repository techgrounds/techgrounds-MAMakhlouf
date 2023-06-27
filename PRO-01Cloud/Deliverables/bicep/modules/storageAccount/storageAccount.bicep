param location string = resourceGroup().location
param storageAccountName string = 'storageacc${uniqueString(resourceGroup().id)}'



resource storageAcount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_GRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountName string = storageAcount.name
output storageAccountBlobEndpoint string = storageAcount.properties.primaryEndpoints.blob
