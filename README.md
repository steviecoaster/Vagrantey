# Vagrantey

[![Build Status](https://dev.azure.com/stephen0130/Vagrantey/_apis/build/status/Vagrantey?branchName=master)](https://dev.azure.com/stephen0130/Vagrantey/_build/latest?definitionId=17&branchName=master)

Working between multiple vagrant environements can really suck. You need to know their paths, and be in that directory to `vagrant up` the VagrantFile. This module streamlines that process by enabling you to configure all of your vagrant environments with a friendly name, and a path, which is stored in a json-formatted configuration file.

Starting up your various environments is then a simple `Start-VagrantEnvironment -Environment $FriendlyName` away. Similar functionality exists for destroying those environments.

The `-Environment` parameter is dynamically populated via an argumentcompleter which reads the configuration file to build the list of available options.

## Installation

It should be enough to `git clone https://github.com/steviecoaster/Vagrantey.git` and load the psd1 file.

Example:

```powershell
cd /users/svalding/Documents/Git
git clone https://github.com/steviecoaster/Vagrantey.git
ipmo ./Vagrantey/Vagrantey.psd1
```

From the Gallery:

`Install-Module Vagrantey -Force`

The following cmdlets are available:

- Get-VagrantConfig
- Set-VagrantConfig
- Start-VagrantEnvironment
- Remove-VagrantEnvironment (equivalent to `vagrant destroy -f`)

## Documentation

Documentation is in the [docs](/docs) folder, or available in shell via `Get-Help $commandname`.
