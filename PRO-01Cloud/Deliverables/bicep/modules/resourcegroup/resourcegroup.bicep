targetScope = 'subscription'

param location string = 'westeurope'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: 'app-prd-rg'
  location: location}

output resourceGroupName string = resourceGroup.name




