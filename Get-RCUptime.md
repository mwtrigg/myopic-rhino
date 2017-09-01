---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCUptime

## SYNOPSIS
Somewhat basic tool that provides a wrapper around Get-CimInstance to return the computer name,
the last boot time and the caluclated uptime (in sortable date and string formats), for one
or more named computers. 
Defaults to localhost.

## SYNTAX

```
Get-RCUptime [[-Computer] <String[]>]
```

## DESCRIPTION
Somewhat basic tool that provides a wrapper around Get-CimInstance to return the computer name,
the last boot time and the caluclated uptime (in sortable date and string formats), for one
or more named computers. 
Defaults to localhost.

Very limited error handling built in; simply prevents blood from being written on the screen; 
will return a "null" for the boot time and uptime for inaccessible computers

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-RCUptime -Computer sv-orl-c03-41
```

---
Returns uptime for the named computer

### -------------------------- EXAMPLE 2 --------------------------
```
Get-RCUptime
```

---
Returns uptime for the localhost

### -------------------------- EXAMPLE 3 --------------------------
```
Get-RCUptime
```

---
Returns uptime for the named computers

## PARAMETERS

### -Computer
{{Fill Computer Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: Localhost
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Requirements:


Created on:   	02/21/2017
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Get-RCUptime.ps1

## RELATED LINKS

