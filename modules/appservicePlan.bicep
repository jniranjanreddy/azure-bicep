param name string
param location string = 'eastus'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: '${name}-plan' // This is a concatination of the name parameter and the string '-plan'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
