
param location string 
// param vnet1Subnet1ID string
// param vnet2Subnet1ID string

resource availabiltySet 'Microsoft.Compute/availabilitySets@2022-11-01' = {
  name: 'azSet'
  location: location
  sku: {
    capacity: 2
    name: 'string'
    tier: 'Classic'
  }
  properties: {
    platformFaultDomainCount: 2
    platformUpdateDomainCount: 3
   
  }
}
 output azSetID string = availabiltySet.id
