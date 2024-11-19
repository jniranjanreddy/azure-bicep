# https://www.youtube.com/watch?v=epoJDvI6JWA&list=PLZ1A-UOV76etaV-zD_aSsW0Y1MIW55dve
```
https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/file
```
## Decorators
```
Decorator	Scope	Purpose
@description	Parameters, Resources, Outputs, Modules	Provides descriptions or metadata.
@minLength	Parameters	Sets minimum length for string parameters.
@maxLength	Parameters	Sets maximum length for string parameters.
@allowed	Parameters	Restricts parameter to a predefined set of values.
@secure	Parameters	Marks parameter values as secure (e.g., passwords).
@default	Parameters	Assigns a default value to a parameter.
@dependsOn	Resources, Modules	Explicitly defines dependencies.
```
| @description                     | arameters, Resources, Outputs, Modules	Provides descriptions or metadata.                          |
| ------------------------------- | --------------------------------------------- |
| @minLength  | Parameters	Sets minimum length for string parameters. |
| @maxLength	 | Parameters	Sets maximum length for string parameters. |
| @allowed	| Parameters	Restricts parameter to a predefined set of values. |
| @secure | Parameters	Marks parameter values as secure (e.g., passwords) |
| @default | Parameters	Assigns a default value to a parameter. |
| @dependsOn | Resources, Modules	Explicitly defines dependencies.|

