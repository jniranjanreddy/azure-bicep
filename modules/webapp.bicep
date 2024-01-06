param name string  = 'app007'  // This is a command line parameter. 
param location string = 'westus'


resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: '${name}-plan' // This is a concatination of the name parameter and the string '-plan'
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}


resource webApplicationdev 'Microsoft.Web/sites@2021-01-15' = {
  name: '${name}-app' // This is a concatination of the name parameter and the string '-app'
  location: location
  properties: {
    serverFarmId: resourceId('Microsoft.Web/serverfarms', '${name}-plan')
  }
  dependsOn: [
    appServicePlan
  ]
}


// webapp settings..
// resource webappsettings 'Microsoft.Web/sites/config@2021-01-15' = {
//   name: 'app-appsettings' // This is a concatination of the name parameter and the string '-app/appsettings'
//   parent: webApplicationdev
//   properties: {
//     appSettings: [
//       {
//         name: 'Environment'
//         value: 'development'
//       }
//       {
//         name: 'PORT'
//         value: '8080'
//       }
//     ]
    
//   }
 
// }



// Application insightes
// resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
//   name: '${name}-insights' // This is a concatination of the name parameter and the string '-insights'
//   location: location
//   kind: 'web'
//   properties: {
//     Application_Type: 'web'
//   }
// }
