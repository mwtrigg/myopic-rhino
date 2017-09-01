---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Connect-RCExchangeOnline

## SYNOPSIS
This is a wrapper for the New- / Import-PSSession Cmdlet to connect to Exchange Online.

## SYNTAX

```
Connect-RCExchangeOnline [[-Credential] <Object>]
```

## DESCRIPTION
This is a wrapper for the New- / Import-PSSession Cmdlet to connect to Exchange Online.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Connect-RCExchangeOnline
```

### -------------------------- EXAMPLE 2 --------------------------
```
Connect-RCExchangeOnline -Credential $Credential
```

## PARAMETERS

### -Credential
{{Fill Credential Description}}

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: (Get-Credential -Message "Enter your administrative credential for Exchange Online")
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Created on:   	04/26/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC

Requires -Version 2.0

## RELATED LINKS

