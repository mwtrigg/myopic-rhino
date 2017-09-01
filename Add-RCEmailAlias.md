---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Add-RCEmailAlias

## SYNOPSIS
This function will add an alias to an existing mailbox

## SYNTAX

```
Add-RCEmailAlias [-Mailbox] <String> [-Alias] <String>
```

## DESCRIPTION
This function can be completed in the GUI and natively in the Exchange Management Shell; although the syntax for doing
so with the Set-Mailbox cmdlet is less than intuitive.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Add-RCEmailAlias.ps1 -Mailbox jdoe -Alias jxd@roncap.com
```

Description
-----------

Add a single email address to the mailbox with the alias jdoe

### -------------------------- EXAMPLE 2 --------------------------
```
Add-RCEmailAlias.ps1 -Mailbox 'john doe' -Alias jxd@roncap.com
```

Description
-----------

Add a single email address to the mailbox with the name 'John Doe'

## PARAMETERS

### -Mailbox
{{Fill Mailbox Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Alias
Enter exactly one email alias; it must be in an accepted address format

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES
Requirements:
 Powershell Version 2.0 or above must be installed on the machine running the script.

Created on:   	03/28/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	Add-RCEmailAlias.ps1

## RELATED LINKS

