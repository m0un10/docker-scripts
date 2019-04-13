# Docker Scripts

A collection of useful bash scripts for Docker.

# Why does this repository exist?

There are various operations that can be performed on docker containers such as extracting files for troubleshooting/migration/backup, executing commands and replacing files such as performing a restore to a data volume or a database restoration. Of course,
these operations are typically achieved through standard docker commands
such as `exec` and `cp`, but the operations are generation specific to the
docker images themselves, as the file locations change depending on the image. If I find myself needing to do something more than once I will generally include it as a script
in this repository so I don't have to relearn how to do it again next time around.

## Using the scripts in this repository

All scripts assume that docker is installed and running natively.

The scripts will use the official docker images where possible.

## Catalog

* [mysql](mysql/README.md)

## Coding Principals

All scripts adhere to the following standards:
- Each script should fail fast if inputs are missing
- Each script should be documented with examples in the README.md of the parent folder
- Where a script provides a useful output it should write only that to standard out to allow piping of scripts
- Scripts should not depend on each other so that they are easy to run in isolation or copy and use in other projects
- Scripts should be able to be executed from any path
- Scripts with a single input should take that from command-line (e.g. `script.sh <input>`)
- Scripts with two predictable inputs should take that from command-line (e.g. `script.sh <input1> <input2>`)
- Scripts with multiple or unpredictable inputs should rely on environment variables (e.g. `NAME=x TYPE=y STATUS=z script.sh`)
- Optional inputs should have default values that can be overridden by environment variables
- Scripts should be kept readable by breaking long lines with `\`
- Where possible, key logic should be included in functions to allow for copy+paste and reuse in other scripts.

# Naming Conventions

Scripts are organised under the convention `<image>/<action>.sh` (e.g. `mysql/backup-db-local.sh`).

Environment variables should be named with object and attribute (e.g. `DATABASE_NAME`). In some cases only object is sufficient (e.g. `DATABASE`) when the attribute is obvious and there is no other environment variables that would make it ambiguous.

## Compatibility

Scripts are generally executed against Darwin (Mac OS X), but should operate fine on other Linux distributions and emulators for Windows.
