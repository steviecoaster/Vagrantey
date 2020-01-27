---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Update-VagrantBox

## SYNOPSIS
Update vagrant box versions

## SYNTAX

### Box (Default)
```
Update-VagrantBox -Box <String> [<CommonParameters>]
```

### Environment
```
Update-VagrantBox [-Environment <String>] [<CommonParameters>]
```

## DESCRIPTION
Update-VagrantBox is a cmdlet which enables the ability to update installed vagrant boxes

## EXAMPLES

### EXAMPLE 1
```
Update-VagrantBox -Box 'myfancybox/win2019'
```

### EXAMPLE 2
```
Update-VagrantBox -Environment 'MyTestLair'
```

### EXAMPLE 3
```
Get-VagrantBox | Where-Object { $_.Name -eq 'foo' } | Update-VagrantBox
```

## PARAMETERS

### -Box
The box you wish to update

```yaml
Type: String
Parameter Sets: Box
Aliases: Name

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Environment
Alternatively, you can update the boxes associated with a specific environment

```yaml
Type: String
Parameter Sets: Environment
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
This can be a a SLOW process, if you are on a weak internet connection.

## RELATED LINKS
