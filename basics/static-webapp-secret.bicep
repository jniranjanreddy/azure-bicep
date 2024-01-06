// param githubtoken = getSecret('bcc5f874-b014-494c-8d36-00c478cfc844','rx-bicep-rg','githubTokenBicep','githubAuthToken')
@secure()
param githubtoken string

param staticAppName string = test123
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
