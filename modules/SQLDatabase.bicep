param location string = 'eastus'
resource sqlServer 'Microsoft.Sql/servers@2014-04-01' ={
  name: 'azbicep-dev-eus-sqlserver-jnr'
  location: location
  properties: {
    administratorLogin: 'sqladmin'
    administratorLoginPassword: 'P@ssw0rd1234'
    // version: '12.0'
  }
}


// resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2014-04-01' = {
//   parent: sqlServer
//   name: 'datasase111'
//   location: location
//   properties: {
//     collation: 'SQL_Latin1_General_CP1_CI_AS'
//     edition: 'Basic'
//     maxSizeBytes: 'maxSizeBytes'
//     requestedServiceObjectiveName: 'Basic'
//   }
// }


resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2023-05-01-preview' = {
  parent: sqlServer
  name: 'datasase111'
  location: location
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    edition: 'Basic'
    maxSizeBytes: 'maxSizeBytes'
    requestedServiceObjectiveName: 'Basic'
  }
}
