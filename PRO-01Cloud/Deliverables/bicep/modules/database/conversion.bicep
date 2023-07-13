@description('User name for the Virtual Machine.')
param adminUserName string

@description('Password for the openvpn user.')
@secure()
param adminPassword string

@description('DNS Name for the publicly accessible node. Must be lowercase. It should match with the following regular expression: ^[a-z][a-z0-9-]{1,61}[a-z0-9]$ or it will raise an error.')
param dnsNamePrefix string = toLower(replace(uniqueString(resourceGroup().id), 'dns', ''))


// @description('Default URI of the template folder. Override with your own URI when using a different path.')
// param _artifactsLocation string = deployment().properties.templateLink.uri

// @description('The sasToken required to access _artifactsLocation.  When the template is deployed using the accompanying scripts, a sasToken will be automatically generated.')
// @secure()
// param _artifactsLocationSasToken string = ''

@description('Location for all resources.')
param location string = resourceGroup().location

// @description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
// @allowed([
//   'sshPublicKey'
//   'password'
// ])
// param authenticationType string = 'sshPublicKey'

// @description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
// @secure()
// param adminPassword string

param vnet1ID string
param vnet1Subnet3ID string
param nsg4Name string

var imagePublisher = 'Canonical'
var imageOffer = 'UbuntuServer'
var nicName = 'myVMNic'
var storageAccountName = '${uniqueString(resourceGroup().id)}standardsa'
var storageAccountType = 'Standard_LRS'
var publicIPAddressName = 'myPublicIP'
var publicIPAddressType = 'Dynamic'
var vmName = 'MyubuntuVM'
// var linuxConfiguration = {
//   disablePasswordAuthentication: true
//   ssh: {
//     publicKeys: [
//       {
//         path: '/home/${adminUserName}/.ssh/authorized_keys'
//         keyData: adminPassword
//       }
//     ]
//   }
// }

resource storageccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: storageAccountName
  location: location
  kind: 'Storage'
  sku: {
    name: storageAccountType
  }
}

resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2022-11-01' = {
  name: publicIPAddressName
  location: location
  properties: {
    publicIPAllocationMethod: publicIPAddressType
    dnsSettings: {
      domainNameLabel: dnsNamePrefix
    }
  }
}



resource nic 'Microsoft.Network/networkInterfaces@2015-06-15' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddress.id
          }
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vnet1ID, vnet1Subnet3ID)
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: resourceId('Microsoft.Network/networkSecurityGroups', nsg4Name)
    }
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2017-03-30' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUserName
      adminPassword: adminPassword
      // linuxConfiguration: ((authenticationType == 'password') ? null  : linuxConfiguration)
    }
    storageProfile: {
      imageReference: {
        publisher: imagePublisher
        offer: imageOffer
        sku: '18_04-lts'
        version: 'latest'
      }
      osDisk: {
        name: '${vmName}_OSDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
  dependsOn: [
    storageccount

  ]
}

resource vmName_newuserscript 'Microsoft.Compute/virtualMachines/extensions@2015-06-15' = {
  parent: vm
  name: 'newuserscript'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Extensions'
    type: 'CustomScript'
    typeHandlerVersion: '2.0'
    autoUpgradeMinorVersion: true
    settings: {
      fileUris: [
        loadFileAsBase64('installSqlServer.sh')
      ]
    }
    protectedSettings: {
      commandToExecute: 'bash installSqlServer.sh ${adminPassword}'
    }
  }
}
