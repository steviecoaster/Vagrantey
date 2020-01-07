---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Get-VagrantPlugin

## SYNOPSIS
Returns vagrant plugin information

## SYNTAX

```
Get-VagrantPlugin [[-Plugin] <String>] [-Installed] [<CommonParameters>]
```

## DESCRIPTION
Returns all plugins, or the specified plugin

## EXAMPLES

### EXAMPLE 1
```
Get-VagrantPlugin
```

Returns all plugins and their version

### EXAMPLE 2
```
Get-VagrantPlugin -Plugin vagrant-yaml
```

### EXAMPLE 3
```
Get-VagrantPlugin -Installed
```

Returns the information for the vagrant-yaml plugin

## PARAMETERS

### -Plugin
The plugin to return

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

### -Installed
Returns all installed Vagrant Plugins

```yaml
Type: SwitchParameter
Parameter Sets: (All)
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

## RELATED LINKS
