# Docker Scripts

A collection of useful bash scripts for Docker.

This repository contains 3 different types of bash scripts

- **direct** - operate directly on containers
- **sidecar** - operate as sidecars to existing containers either by joining the network or accessing a shared volume
- **client** - scripts that use docker for containing dependencies required to connect and operate with other services (not necessarily other containers)

## Why does this repository exist?

There are various operations that can be performed on docker containers such as extracting files for troubleshooting/migration/backup, executing commands and replacing files such as performing a restore to a data volume or a database restoration. Of course,
these operations are typically achieved through standard docker commands
such as `exec` and `cp`, but the operations are generally specific to the
docker images themselves, as the file locations change depending on the image. If I find myself needing to do something more than once I will generally include it as a script
in this repository so I don't have to re-learn how to do it again next time around.

## Using the scripts in this repository

All scripts assume that docker is installed and running natively.

## Catalog

* [mysql](mysql/README.md)
* [oracle](oracle/README.md)

## Compatibility

Scripts are generally executed against Darwin (Mac OS X), but should operate fine on other Linux distributions and emulators for Windows.

## Contributing

Please see [CONTRIBUTING.md])(CONTRIBUTING.md) for more details.
