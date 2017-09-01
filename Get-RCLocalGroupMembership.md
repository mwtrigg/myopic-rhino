---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCLocalGroupMembership

## SYNOPSIS
List local group members on the local or a remote computer

## SYNTAX

```
Get-RCLocalGroupMembership [[-Computer] <String[]>] [[-Group] <String>] [-IncludeEmpty]
```

## DESCRIPTION
{{Fill in the Description}}

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-RCLocalGroupMembership -Computer sv-orl-c03-41,wits-orl-mtrigg -Group 'administrators'
```

---
Get members of the Local Administrators group on the two named computers

### -------------------------- EXAMPLE 2 --------------------------
```

```

## PARAMETERS

### -Computer
{{Fill Computer Description}}

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: 

Required: False
Position: 1
Default value: $env:computername
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
{{Fill Group Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 2
Default value: *
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeEmpty
{{Fill IncludeEmpty Description}}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: Emtpy, All

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

