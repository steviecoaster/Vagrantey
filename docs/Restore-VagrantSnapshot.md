---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Restore-VagrantSnapshot

## SYNOPSIS
Restores a vagrant snapshot

## SYNTAX

```
Restore-VagrantSnapshot [-Environment] <String> [[-Name] <String>] [<CommonParameters>]
```

## DESCRIPTION
Restores a vagrant snapshot

## EXAMPLES

### EXAMPLE 1
```
Restore-VagrantSnapshot -Environment MyAwesomeVM
```

### EXAMPLE 2
```
Restore-VagrantSnapshot -Environment MyAwesomeVM -Name TestSnappy
```

## PARAMETERS

### -Environment
The vagrant environment to restore

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

### -Name
If given, restores the provided friendly-named snapshot

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

## RELATED LINKS
