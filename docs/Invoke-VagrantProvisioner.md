---
external help file: Vagrantey-help.xml
Module Name: Vagrantey
online version:
schema: 2.0.0
---

# Invoke-VagrantProvisioner

## SYNOPSIS
Re-runs provisioning against a vagrant environment.

## SYNTAX

### Specific
```
Invoke-VagrantProvisioner [-Environment] <String> -Provisioner <String> [<CommonParameters>]
```

### All
```
Invoke-VagrantProvisioner [-Environment] <String> [-All] [<CommonParameters>]
```

## DESCRIPTION
If a vagrant box has already been provisioned, forces execution of the specified provisioner(s).

## EXAMPLES

### EXAMPLE 1
```
Invoke-VagrantProvisioner -Environment Test -All
```

Re-runs all defined provisioners for Test vagrant host.

### EXAMPLE 2
```
Invoke-VagrantProvisioner -Environment Test -Provisioner Shell
```

Re-runs the shell provisioner against the Test vagrant host.

## PARAMETERS

### -Environment
The vagrant environment to re-provision.

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

### -All
Re-run all defined provisioners in the Vagrantfile of the specified environment.

```yaml
Type: SwitchParameter
Parameter Sets: All
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Provisioner
Specific provisioner to execute from the Vagrantfile of the specified environment

```yaml
Type: String
Parameter Sets: Specific
Aliases:

Required: True
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
General notes

## RELATED LINKS
