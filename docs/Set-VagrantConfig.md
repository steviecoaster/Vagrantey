---
external help file: PSVagrant-help.xml
Module Name: PSVagrant
online version:
schema: 2.0.0
---

# Set-VagrantConfig

## SYNOPSIS
Configure different environments for your system

## SYNTAX

```
Set-VagrantConfig [-Name] <String> [-Path] <String> [<CommonParameters>]
```

## DESCRIPTION
Specify the friendly name of the environment, as well as the Path to the Vagrant File for the environment

## EXAMPLES

### EXAMPLE 1
```
Set-VagrantConfig -Name Foo -Path /my/path/to/foo
```

## PARAMETERS

### -Name
The friendly name for the environment

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

### -Path
The path to the vagrant file

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Specifying the actual vagrant file is not necessary.
The path is simply the path to where the vagrantfile resides on disk

## RELATED LINKS
