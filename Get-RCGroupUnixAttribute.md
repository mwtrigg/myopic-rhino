---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCGroupUnixAttribute

## SYNOPSIS
Wrapper function that retrieves the UNIX attributes from a given AD User

## SYNTAX

```
Get-RCGroupUnixAttribute [-Group] <String> [-Domain <Object>]
```

## DESCRIPTION
Wrapper function that retrieves the UNIX attributes from a given AD User

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ADGroup -Filter 'name -like "*systems*"' | ForEach-Object {Get-RCGroupUnixAttribute -Group $_.SamAccountName}
```

### -------------------------- EXAMPLE 2 --------------------------
```
Get-RCGroupUnixAttribute -Group Systems
```

## PARAMETERS

### -Group
{{Fill Group Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

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


Created on:   	03/05/2017
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Get-RCGroupUnixAttribute.ps1

## RELATED LINKS

