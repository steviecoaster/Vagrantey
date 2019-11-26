---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Get-VagrantConfig

## SYNOPSIS
Returns current configuration for this module

## SYNTAX

```
Get-VagrantConfig [[-Path] <String>] [<CommonParameters>]
```

## DESCRIPTION
Returns the json config file for the module as an object

## EXAMPLES

### EXAMPLE 1
```
Get-VagrantConfig
```

Return default configuration

### EXAMPLE 2
```
Get-VagrantConfig -Path C:\vagrantey\config.json
```

Return the configuration found in C:\vagrantey\config.json

## PARAMETERS

### -Path
If you store your config outside of the module default, use Path to specify it

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
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
