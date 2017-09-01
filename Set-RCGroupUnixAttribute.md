---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Set-RCGroupUnixAttribute

## SYNOPSIS
Wrapper function that sets the UNIX attributes to a known value and pattern based upon the RID/SID of a given AD User in 
the RONIN domain, it will pad the RID of a RIVAL user to avoid conflicts with RONIN. 
All done only IF the values are not
already populated.

## SYNTAX

```
Set-RCGroupUnixAttribute [-Group] <String> [-Domain <Object>] [-Force]
```

## DESCRIPTION
Wrapper function that sets the UNIX attributes to a known value and pattern based upon the RID/SID of a given AD User in 
the RONIN domain, it will pad the RID of a RIVAL user to avoid conflicts with RONIN. 
All done only IF the values are not
already populated.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-ADGroup -Filter * -SearchBase "DC=ronin,DC=roncap,DC=com" |
```

ForEach-Object {Set-RCGroupUnixAttributes -Identity $_.SamAccountName}

### -------------------------- EXAMPLE 2 --------------------------
```
Set-RCGroupUnixAttribute Systems_Group
```

### -------------------------- EXAMPLE 3 --------------------------
```
Set-RCGroupUnixAttribute Systems_Group -Domain rivalsystems.com -Force
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

### -Force
{{Fill Force Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Requirements:


Created on:   	03/30/2017
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Set-RCGroupUnixAttribute.ps1

## RELATED LINKS

