param appName string = 'myApp'
param secretName string = 'myAppSecret'
param apiPermissions array = [
  {
    'name': 'User.Read'
    'resourceAppId': '00000003-0000-0000-c000-000000000000'
    'resourceAccess': [
      {
        'id': 'e1fe6dd8-ba31-4d61-89e7-88639da4683d'
        'type': 'Scope'
      }
    ]
  }
  {
    'name': 'email'
    'resourceAppId': '00000003-0000-0000-c000-000000000000'
    'resourceAccess': [
      {
        'id': '64a6cdd6-aab1-4aaf-94b8-3cc8405e90d0'
        'type': 'Scope'
      }
    ]
  }
  {
    'name': 'profile'
    'resourceAppId': '00000003-0000-0000-c000-000000000000'
    'resourceAccess': [
      {
        'id': '14dad69e-099b-42c9-810b-d002981feec1'
        'type': 'Scope'
      }
    ]
  }
]

resource appRegistration 'Microsoft.Authorization/applications@2021-04-01-preview' = {
  name: appName
  location: 'eastus'
  properties: {
    displayName: appName
    requiredResourceAccess: [
      for permission in apiPermissions: {
        resourceAppId: permission.resourceAppId
        resourceAccess: [
          
        ]
      }
    ]
  }
}

resource appSecret 'Microsoft.Authorization/applications/secrets@2021-04-01-preview' = {
  parent: appRegistration
  name: secretName
  properties: {
    value: 'MySecretValue'
    startDate: '2024-01-01'
    endDate: '2025-01-01'
  }
}
