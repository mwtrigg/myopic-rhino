---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCUserUnixAttribute

## SYNOPSIS
Wrapper function that retrieves the UNIX attributes from a given AD User

## SYNTAX

```
Get-RCUserUnixAttribute [-User] <String> [-Domain <Object>]
```

## DESCRIPTION
Wrapper function that retrieves the UNIX attributes from a given AD User

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ADUser -Filter 'name -like "*jdoe*"' | ForEach-Object {Get-RCUserUnixAttribute -User $_.SamAccountName}
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-RCUserUnixAttribute -User jdoe
```

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


Created on:   	01/05/2017
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Get-RCUserUnixAttribute.ps1

## RELATED LINKS

