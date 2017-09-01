---
external help file: RoninCapital-help.xml
online version: 
schema: 2.0.0
---

# Get-RCMailboxPermission

## SYNOPSIS
Report the combined results of a Get-MailboxPermission and Get-ADPermission query against a given mailbox; filter out non-inherited permissions

## SYNTAX

```
Get-RCMailboxPermission [-Mailbox] <String>
```

## DESCRIPTION
Report the combined results of a Get-MailboxPermission and Get-ADPermission query against a given mailbox; filter out non-inherited permissions.

The following permissions are excluded from the results:

     - Inherited Permissions
     - AD: Allow: Everyone --\> User-Change-Password
     - AD: Allow: Domain Admins --\> Generic Read
     - Any: Any: NT AUTHORITY\*
     - Any: Any: S-1-5-*
     - Any: Any: RONIN\RAS and IAS Servers

## EXAMPLES

### -------------------------- EXAMPLE 1 --------------------------
```
Get-RCMailboxPermission -Mailbox jdoe
```

### -------------------------- EXAMPLE 2 --------------------------
```
'jdoe','bdoe' | ForEach-Object {Get-RCMailboxPermission $_ } | Format-Table -AutoSize -Wrap
```

## PARAMETERS

### -Mailbox
Param1 help description

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
Created on:   	05/19/2016
Created by:   	Michael Trigg
Organization: 	Ronin Capital, LLC
Filename:     	func-Get-RCMailboxPermission.ps1

## RELATED LINKS

