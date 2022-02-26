# Yves' workspace configuration
Files and scripts I use for my workspace configuration

Heavily inspired by https://github.com/scottmuc/osx-homedir

All scripts are designed to be idempotent and can therfore be rerun.

## Update a previously setup machine
```
./scripts/setup/setup-machine.sh
```

## Bootsrapping a new machine
Prerequisites:
Install/Activate git

```
curl -sSL https://raw.githubusercontent.com/ybonjour/workspace-configuration/master/scripts/setup/bootstrap.sh | bash
~/scripts/setup/setup-machine.sh
```

