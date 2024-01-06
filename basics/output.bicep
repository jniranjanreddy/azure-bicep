metadata description = 'Creates a storage account and a web app'

@description('The prefix to use for the storage account name.')
@minLength(3)
@maxLength(11)

param Myenvironment string = 'dev'

output environment string = Myenvironment
