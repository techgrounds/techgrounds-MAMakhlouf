targetScope = 'subscription'

param rgName string
param location string

resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
}

output resourceGroupName string = resourceGroup.name
