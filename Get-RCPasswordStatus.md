---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCPasswordStatus

## SYNOPSIS
This function retrieves and calculates basic useful information for a specified user accounts password.

## SYNTAX

```
Get-RCPasswordStatus [-User] <String> [-Domain <Object>]
```

## DESCRIPTION
This function is an enhancement of the native Get-ADUserResultantPasswordPolicy and Get-ADDefaultDomainPasswordPolicy. 
In addition to the information normally provided by using either of these cmdlets, it determines the age of the password,
calculates the date of expiration, the number of days remaining to expiration, whether or not the password even expires.
It also dynamically determines this information based upon whether or not the user account is the subject of a Fine-Grained
Password Policy.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-RCUserPasswordStatus -Account Administrator -Domain ronin.roncap.com
```

Description
-----------

## PARAMETERS

### -User
{{Fill User Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: SamAccountName

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Domain
{{Fill Domain Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: Ronin.roncap.com
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Requirements:
PowerShellv2 or above must be installed on the computer running the script

Created on:   	12/07/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Get-RCPasswordStatus.ps1


Requires -Version 2.0
Requires -Module ActiveDirectory

## RELATED LINKS

