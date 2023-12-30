// param location string = resourceGroup().location
param location string = 'eastus'
param SAname string = 'storageaccountrx'

resource storageaccount 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: SAname
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Premium_LRS'
  }
  properties: {
    supportsHttpsTrafficOnly: true
  }
}

var nameArray = [
  'james'
  'andrew'
  1
  3

]

output result string = nameArray[1]

var person = {
  name: 'james'
  lastName: 'ray'
  age: 30
  isMarried: false
  address: {
    street: '123 main st'
    city: 'seattle'
  }
}

output result string = person.address.city
