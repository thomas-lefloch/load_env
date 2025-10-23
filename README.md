# load_env
Powershell scripts that loads a .env file into the environement variables.

## Usage
Load-DotEnv.ps1  
Usage:  
  Load env vars:    .\Load-DotEnv.ps1 .env  
  Remove env vars:  .\Load-DotEnv.ps1 .env -Remove  

/!\ It trims the following characters off the value `'`, `"`, ` `
