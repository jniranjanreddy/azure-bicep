# azure-bicep
## bicep Linting

## How to install powershell AZ module for.
```
Install-Module -Name Az -Repository PSGallery -Force

In powershell command, execute below command to login to portal
 
PS /mnt/c/Users/NJannapureddy> Connect-AzAccount -UseDeviceAuthentication
WARNING: You may need to login again after updating "EnableLoginByWam".
Please select the account you want to login with.

[Login to Azure] To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code BL2XXXXX to authenticate.
Retrieving subscriptions for the selection

Open this in the bwowser and provide code, then it aks to choose the subscription.
```





```

```
root@dev-server01:/jnr/azure-bicep/basics# /root/.azure/bin/bicep build main.bicep
/jnr/azure-bicep/basics/main.bicep(4,29) : Error BCP236: Expected a new line or comma character at this location.
/jnr/azure-bicep/basics/main.bicep(4,31) : Error BCP018: Expected the ":" character at this location.

```

```
root@dev-server01:~# az bicep version
Bicep CLI not found. Install it now by running "az bicep install".

root@dev-server01:~# az bicep install
Installing Bicep CLI v0.12.40...
Successfully installed Bicep CLI to "/root/.azure/bin/bicep".

root@dev-server01:~# az bicep version
Bicep CLI version 0.12.40 (41892bd0fb)

root@dev-server01:~#
```
## First Resource group to use Biceps..
```
az group create -l eastus -g 'bicepResourceGroup'
root@dev-server01:/jnr/azure-bicep/basics# az deployment group create -g 'playground-sandbox' -f main.bicep
/jnr/azure-bicep/basics/main.bicep(3,13) : Warning no-hardcoded-location: A resource location should not use a hard-coded string or variable value. Please use a parameter value, an expression, or the string 'global'. Found: 'centralus' [https://aka.ms/bicep/linter/no-hardcoded-location]

{
  "id": "/subscriptions/123456789/sandbox/providers/Microsoft.Resources/deployments/main",
  "location": null,
  "name": "main",
  "properties": {
    "correlationId": "123456789",
    "debugSetting": null,
    "dependencies": [],
    "duration": "PT37.1881532S",
    "error": null,
    "mode": "Incremental",
    "onErrorDeployment": null,
    "outputResources": [
      {
        "id": "/subscriptions/12345/resourceGroups/playground-sandbox/providers/Microsoft.Storage/storageAccounts/storagenirulabs",
        "resourceGroup": "playground-sandbox"
      }
    ],
    "outputs": null,
    "parameters": null,
    "parametersLink": null,
    "providers": [
      {
        "id": null,
        "namespace": "Microsoft.Storage",
        "providerAuthorizationConsentState": null,
        "registrationPolicy": null,
        "registrationState": null,
        "resourceTypes": [
          {
            "aliases": null,
            "apiProfiles": null,
            "apiVersions": null,
            "capabilities": null,
            "defaultApiVersion": null,
            "locationMappings": null,
            "locations": [
              "centralus"
            ],
            "properties": null,
            "resourceType": "storageAccounts",
            "zoneMappings": null
          }
        ]
      }
    ],
    "provisioningState": "Succeeded",
    "templateHash": "12742785101193320947",
    "templateLink": null,
    "timestamp": "2022-11-29T08:59:02.925957+00:00",
    "validatedResources": null
  },
  "resourceGroup": "playground-sandbox",
  "tags": null,
  "type": "Microsoft.Resources/deployments"
}
root@dev-server01:/jnr/azure-bicep/basics#
```
## how to use parameters
```
az deployment group create -g 'deploy-group' -f 'Path to hello.bicep' -p 'path of parameter file.'
```
## what-if for Dry run
```
az deployment group what-if --resource-group whatIfRg  --name 'Resource-group' --template-file
New-AzResourceGroupDeployment -ResourceGroupName DevOps-IAC-rg -TemplateFile webapp.bicep
```
## Data Types
```
arrays, bool, int, object, string

```
## Decorators
```
allowed
secure
minLength & maxLength
minValue & maxValue
description
metadata
```
## What-if
```
az deployment group create -g DevOps-IAC-rg -f webapp.bicep --confirm-with-what-if

```
