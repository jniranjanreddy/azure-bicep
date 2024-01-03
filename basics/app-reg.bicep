@allowed([
  'dev'
  'tst'
  'stg'
  'prd'
])
param environmentType string
param project string
param approvedby string
param location string
param servicename string

module webapp 'Modules/webapp.bicep' = {
  name: 'webappModule'
  params: {
    project: project
    environmentType: environmentType
    approvedby: approvedby
    location: location
    servicename: servicename

  }
}
output webappid string = webapp.outputs.id

