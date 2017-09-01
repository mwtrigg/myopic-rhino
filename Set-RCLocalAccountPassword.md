---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Set-RCLocalAccountPassword

## SYNOPSIS
This script can be used to set the password to a defined value for an account local to a remote system.

## SYNTAX

```
Set-RCLocalAccountPassword [-Password] <String[]> [[-LocalAcct] <String[]>] [[-Computer] <String[]>]
```

## DESCRIPTION
This script can be used to set the password of one or multiple accounts on one or more remote systems to a value defined in the command or a value
passed via the pipeline.

While other solutions exist to acheive this goal, the Firm wanted to automate as much of the process as possible, but retaining the static or non-
random nature of the password. 
If not wanting to use a script, or if the Firm decides to use radomized passwords, a script from Microsoft does 
exist, though in that case, I believe Local Account Password Solution (LAPS) from Microsoft would be a more appropriate solution. 
Links to other
automated or semi-automated methods to accomplish this are listed below.


Lightly sampled from Invoke-PasswordRoll.ps1, authored by Microsoft (https://support.microsoft.com/en-us/kb/2962486)
Local Account Password Solution (LAPS) by Microsoft (https://www.microsoft.com/en-us/download/details.aspx?id=46899)

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
.\Invoke-RCLocalAccountPasswordReset.ps1 -Password 'Welcome!' -Account Administrator -Computer SV-ORL-C00-00
```

Description
-----------

Sets the password for the Local account Administrator on a remote computer named SV-ORL-C00-00 to "Welcome!"

### -------------------------- EXAMPLE 2 --------------------------
```
Get-ADComputer -Filter {(Name -like "SV-ORL-C*") -and (Enabled -eq $True)} | ForEach-Object {
```

.\Invoke-RCLocalAccountPasswordReset.ps1 -Password 'Welcome!' -Account Administrator -Computer $_.Name}

Description
-----------

Accepts the output of a query of AD Computer objects, and sets a single password for the local account "Administrator"
on the computers returned by the query specified.

### -------------------------- EXAMPLE 3 --------------------------
```
Import-Csv -Path C:\Path\to\test.csv | .\Invoke-RCLocalAccountPasswordReset.ps1
```

Description
-----------

Sets the password for the local accounts specified in the CSV file, on the remote computers specified, to 
the passwords specified. 
A sample of an appropriate CSV file (header row required) would look like:

=====================================
Password,Account,Computer
Welcome!,Administrator,SV-ORL-C00-00
HelpMe!!,serviceaccount,SV-ORL-C00-01
Welcome2,Administrator,WITS-ORL-TEST1

## PARAMETERS

### -Password
{{Fill Password Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -LocalAcct
{{Fill LocalAcct Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Account

Required: False
Position: 2
Default value: Administrator
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Computer
{{Fill Computer Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 3
Default value: Localhost
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Converted from script Invoke-RCLocalAccountPasswordReset.ps1 to function Set-RCLocalPassword

Requirements:
PowerShellv2 or above must be installed on the computer running the script

Created on:   	02/22/2016
Created by:   	Michael Trigg
Revised on:   	12/07/2016
Revised by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Set-RCLocalAccountPassword.ps1


Requires -Version 2.0

## RELATED LINKS

