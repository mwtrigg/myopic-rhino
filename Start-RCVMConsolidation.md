---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Start-RCVMConsolidation

## SYNOPSIS
Start VMDK Consolidation on specified VM.

## SYNTAX

```
Start-RCVMConsolidation [-VM] <String>
```

## DESCRIPTION
Start VMDK Consolidation on specified VM. 
This runs the consolidation as a task; of which status can be checked on
by using the PowerCLI cmdlet Get-Task. 
The function performs some basic logic by ensuring the selected VM exists,
that there are not more than one with the same name, and that consolidation is even needed before proceeding.

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Example of how to use this cmdlet
```

### -------------------------- EXAMPLE 2 --------------------------
```
Another example of how to use this cmdlet
```

## PARAMETERS

### -VM
{{Fill VM Description}}

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

## INPUTS

## OUTPUTS

## NOTES
Requirements:


Created on:   	12/15/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Start-RCVMConsolidation.ps1

Requires -Module VMware.VimAutomation.Core

## RELATED LINKS

