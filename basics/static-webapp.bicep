@secure()
param githubtoken string

param staticAppName string
param location string = 'eastus2'

resource azstaticapp 'Microsoft.Web/staticSites@2022-09-01' = {
  name: staticAppName
  location: location
  tags: {
    createdbyemail: 'iac@rhythmx.ai'
  }
  sku: {
    tier: 'standard'
    name: 'standard'
  }
  kind: 'app'
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    allowConfigFileUpdates: true
    buildProperties: {
      appBuildCommand: 'npm run build'
      appLocation: './'
      skipGithubActionWorkflowGeneration: false
    }

    // repositoryToken: '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'
    repositoryToken: githubtoken
    repositoryUrl: 'https://github.com/RhythmX-AI/rx-ui.git'
    branch: 'bicep'
  }
}
