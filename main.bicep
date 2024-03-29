@secure()
param githubtoken string
param staticAppName string
param location string = 'eastus2'


resource kv 'Microsoft.KeyVault/vaults@2023-02-01' existing = {
  name: kvName
  scope: resourceGroup(bcc5f874-b014-494c-8d36-00c478cfc844, DevOps-IAC-rg )
}






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
    repositoryToken: githubtoken
    repositoryUrl: 'https://github.com/RhythmX-AI/rx-ui.git'
    branch: 'bicep'
  }
}
