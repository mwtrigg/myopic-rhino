---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCLockoutSource

## SYNOPSIS
This function automates some of the process of locating the computer which was the source of the failed login attempt that triggered
the account lockout.

## SYNTAX

```
Get-RCLockoutSource [-User] <Object> [-Domain <Object>]
```

## DESCRIPTION
This function (which requires the ActiveDirectory module) will retrieve lockout-related information from all Domain Controllers in the domain,
and then query the event logs of the Domain Controller with the PDCemulator FSMO role. 
It will pull all lockout events (there may be multiple),
and will display the source computer for each of the lockout events. 
The function will then take an educated guess as to where the lockout
by matching up the time of the lockout on the user account with the time of the event (in case multiple logins are attempted from multiple
sources).

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-RCLockoutSource -User mtrigg
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-RCLockoutSource (Search-ADAccount -LockedOut).SamAccountname
```

## PARAMETERS

### -User
{{Fill User Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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
Default value: RONIN
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Requirements:


Created on:   	05/11/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fGet-RCLockoutSource.ps1

Requires -Module ActiveDirectory

## RELATED LINKS

