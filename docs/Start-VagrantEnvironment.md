---
external help file: PSVagrant-help.xml
Module Name: PSVagrant
online version:
schema: 2.0.0
---

# Start-VagrantEnvironment

## SYNOPSIS
Start a vagrant environment by specifying it's friendly name

## SYNTAX

```
Start-VagrantEnvironment [-Environment] <String> [<CommonParameters>]
```

## DESCRIPTION
Reads the backend path to a vagrant directory and starts that environment based on the environment's friendly name

## EXAMPLES

### EXAMPLE 1
```
Start-VagrantEnvironment -Environment CCM
```

## PARAMETERS

### -Environment
The friendly name of the vagrant environment to start

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

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
