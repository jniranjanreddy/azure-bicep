param webAppName string
param appSettings object[]

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: webAppName
  location: 'West US'
  properties: {
    serverFarmId: '/subscriptions/<subscriptionId>/resourceGroups/<resourceGroupName>/providers/Microsoft.Web/serverfarms/<appServicePlanName>'
    siteConfig: {
      appSettings: [
        for (setting in appSettings) {
          {
            name: setting.key
            value: setting.value
          }
        }
      ]
    }
  }
}
