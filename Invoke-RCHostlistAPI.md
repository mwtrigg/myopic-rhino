---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Invoke-RCHostlistAPI

## SYNOPSIS
Short description

## SYNTAX

```
Invoke-RCHostlistAPI [-Payload] <Object> [-Service] <String> [-Method] <String> [[-Token] <String>]
```

## DESCRIPTION
Long description

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Invoke-RCHostlistAPI -Payload psys-addc1 -Service hosts -Method Get
```

### -------------------------- EXAMPLE 2 --------------------------
```
Invoke-RCHostlistAPI -Payload 347 -Service hosts -Method Delete
```

### -------------------------- EXAMPLE 3 --------------------------
```
$Payload = [PSCustomObject]@{
```

'hostname'='dsys-vorl-test';
             'serial_number'='123456789';
             'system_group'='windows';
             'host_type'=''}


Invoke-RCHostlistAPI -Payload $Payload -Service hosts -Method Post

## PARAMETERS

### -Payload
Payload is an object for POSTs and PATCHes, a string (computername) for GETs and an integer (id) for DELETEs

```yaml
Type: Object
Parameter Sets: (All)
Aliases: 

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Service
{{Fill Service Description}}

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

### -Method
{{Fill Method Description}}

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Token
Defaults to st_LogonLogs's personal account token

```yaml
Type: String
Parameter Sets: (All)
Aliases: 

Required: False
Position: 4
Default value: C7751a4b25020fb6e452f767fcccd9ad8f0b325f
Accept pipeline input: False
Accept wildcard characters: False
```

## INPUTS

## OUTPUTS

### System.Int32

## NOTES

## RELATED LINKS

