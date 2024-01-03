param appName string = 'static-web-app'
param location string = 'eastus2'
param resourceGroupName string = 'DevOps-IAC-rg'
param storageAccountName string = 'iactest1'
param appLocation string = '/'
param githubRepoUrl string = 'https://github.com/RhythmX-AI/rx-ui'
param githubRepoBranch string = 'development'
param githubRepoToken string = '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'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-03-01' = {
  name: '${appName}-plan'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
    size: 'S1'
    family: 'S'
    capacity: 1
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: appName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      appSettings: [
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '14'
        }
      ]
    }
  }
}

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource staticWebApp 'Microsoft.Web/staticSites@2023-01-01' = {
  name: appName
  location: location
  properties: {
    repositoryUrl: githubRepoUrl
    buildProperties: {
      appLocation: appLocation
    }
    sku: {
      name: 'Free'
    }
    repositoryToken: githubRepoToken
    repositoryBranch: githubRepoBranch
    customDomains: []
    apiLocation: ''
    appArtifactLocation: storageAccount.id
  }
}

// output staticWebAppUrl string = staticWebApp.properties.defaultHostname
