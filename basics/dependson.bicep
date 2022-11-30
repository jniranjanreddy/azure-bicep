var location = 'centralus'

resource webApplication 'Microsoft.Web/sites@2022-03-01'  = {
  name: 'awsomewebapp'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'awesomeasp'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}
