param location string = 'eastus'
param namePrefix string = 'paulon'

param appPlanID string

resource webApplication 'Microsoft.Web/sites@2022-03-01' = {
  name: '${namePrefix}-site'
  location: location

  properties: {
    serverFarmId: appPlanID
    httpsOnly: true

  }
}
output webAppURL string = webApplication.properties.hostNames[0]













