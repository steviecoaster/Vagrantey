---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# New-VagrantSnapshot

## SYNOPSIS
Create a snapshot of a Vagrant VM

## SYNTAX

### BuiltIn (Default)
```
New-VagrantSnapshot [-Environment <String>] [-Name <String>] [<CommonParameters>]
```

### Sahara
```
New-VagrantSnapshot [-Environment <String>] [-UseSahara] [<CommonParameters>]
```

## DESCRIPTION
Snapshots a Vagrant VM using either built-in tooling, or the Sahara plugin

## EXAMPLES

### EXAMPLE 1
```
New-VagrantSnapshot -Environment MyAwesomeEnv
```

### EXAMPLE 2
```
New-VagrantSnapshot -Environment MyAwesomeEnv -UseSahara
```

### EXAMPLE 3
```
New-VagrantSnapshot -Environment MyAwesomeEnv -Name TestSnapshot
```

## PARAMETERS

### -Environment
The Vagrant Environment to snapshot

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
If desired, give the snapshot a friendly name, otherwise a random name will be given by vagrant

```yaml
Type: String
Parameter Sets: BuiltIn
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseSahara
Force the use of the Sahara plugin

```yaml
Type: SwitchParameter
Parameter Sets: Sahara
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS
