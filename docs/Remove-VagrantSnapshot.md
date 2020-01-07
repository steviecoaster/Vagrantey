---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Remove-VagrantSnapshot

## SYNOPSIS
Deletes a Vagrant snapshot

## SYNTAX

### BuiltIn (Default)
```
Remove-VagrantSnapshot [-Environment <String>] [-Name <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

### Sahara
```
Remove-VagrantSnapshot [-Environment <String>] [-UseSahara] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Deletes a Vagrant snapshot

## EXAMPLES

### EXAMPLE 1
```
Remove-VagrantSnapshot -Environment MyAwesomeVM
```

### EXAMPLE 2
```
Remove-VagrantSnapshot -Environment MyAwesomeVM -Name Test
```

### EXAMPLE 3
```
Remove-VagrantSnapshot -Environment MyAwesomeVM -UseSahara
```

## PARAMETERS

### -Environment
The Environment from which to delete a snapshot

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
The friendly name of the snapshot to delete, if any

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
Use Sahara plugin

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

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
