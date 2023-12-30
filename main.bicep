param location string = 'eastus'
param storageName string = 'rhythmx'

param namePrefix string = 'paul'


targetScope = 'resourceGroup'


module storage 'modules/storage.bicep' = {
  name: storageName
  params: {
    storageName: storageName
    location: location
  }
}

module appPlanDeploy 'modules/servicePlan.bicep' = {
  name: '${namePrefix}-appPlanDeploy'
  params: {
    namePrefix: namePrefix
    location: location
  }
}



module deployWebSite 'modules/webapp.bicep' = {
  name: '${namePrefix}-deploy-website'
  params: {
    namePrefix: namePrefix
    location: location

  }
}
output siteURL string = deployWebSite.outputs.siteURL

