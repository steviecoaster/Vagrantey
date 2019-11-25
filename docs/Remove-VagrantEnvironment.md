---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Remove-VagrantEnvironment

## SYNOPSIS
Equivalent to 'vagrant destroy -f'

## SYNTAX

```
Remove-VagrantEnvironment [-Environment] <String> [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Destroys the specified vagrant environment.
(Don't worry, it's -Confirm gated :))

## EXAMPLES

### EXAMPLE 1
```
Remove-VagrantEnvironment -Environment CCM
```

This will prompt for confirmation

### EXAMPLE 2
```
Remove-VagrantEnvironment -Environment CCM -Confirm:$false
```

This will destroy the environment without prompting

## PARAMETERS

### -Environment
The vagrant environment to destroy

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
