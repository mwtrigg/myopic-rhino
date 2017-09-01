---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Connect-RCVIServer

## SYNOPSIS
Import the appropriate modules (if necessary), and connect to one or more vSphere Hypervisors or vCenter Servers

## SYNTAX

### Single
```
Connect-RCVIServer [-VMHosts <String[]>] [-Credential <PSCredential>]
```

### All
```
Connect-RCVIServer [-Credential <PSCredential>] [-All]
```

### Group
```
Connect-RCVIServer [-Credential <PSCredential>] [-ORL] [-SEC] [-US] [-UK] [-Asia] [-Test]
```

## DESCRIPTION
Import the appropriate modules (if necessary), and connect to one or more vSphere Hypervisors or vCenter Servers.
This function is essentially a wrapper around PowerCLI's own Connect-VIServer cmdlet, with some validation built
in for available vSphere Hypervisors as well as some basic grouping to allow selection of multiple hosts based
upon location (i.e.
"Test" grabs both hypervisors in the test environment)

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```

```

### -------------------------- EXAMPLE 2 --------------------------
```
Another example of how to use this cmdlet
```

## PARAMETERS

### -VMHosts
{{Fill VMHosts Description}}

```yaml
Type: String[]
Parameter Sets: Single
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
{{Fill Credential Description}}

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases: 

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ORL
{{Fill ORL Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -SEC
{{Fill SEC Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -US
{{Fill US Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -UK
{{Fill UK Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Asia
{{Fill Asia Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Test
{{Fill Test Description}}

```yaml
Type: SwitchParameter
Parameter Sets: Group
Aliases: 

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -All
{{Fill All Description}}

```yaml
Type: SwitchParameter
Parameter Sets: All
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


Created on:   	09/01/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	fx_Connect-RCVIServer.ps1

Requires -Module Vmware.VimAutomation.Core

## RELATED LINKS

