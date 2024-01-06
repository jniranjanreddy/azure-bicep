param keyVaultName string = githubTokenBicep.githubAuthToken
param secretName string

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: resourceGroup().location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: 'YOUR_OBJECT_ID'
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

output secretValue string = secureString(reference(keyVault.name, '2021-06-01-preview').secrets[secretName].value)
