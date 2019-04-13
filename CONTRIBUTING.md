Contributions are welcome!

Below are the standards that I adhered to in developing the scripts:

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
- Sidecar scripts should rely on `DOCKER_NETWORK` and `DOCKER_VOLUME` environment variables as the source for connectivity
- Sidecar and external scripts should not use hardcoded names and ports to avoid conflicts and should clean up afterwards (`--rm`)
- Direct scripts should take the container name as the first argument. (e.g. `script.sh <input>`)
- Use official images by default. Images should be able to changed with `IMAGE` environment variable

Scripts are organised under the following convention

| Type of Script | Naming Convention                | Example                           |
| -------------- | -------------------------------- | --------------------------------- |
| Direct         | `<service>/<action>.sh`          | `mysql/load-db.sh`                |
| Sidecar        | `<service>/sidecar/<action>.sh`  | `oracle/sidecar/create-schema.sh` |
| External       | `<service>/client/<action>.sh` | `mysql/external/backup-db.sh`     |

Environment variables should be named with object and attribute (e.g. `DATABASE_NAME`). In some cases only object is sufficient (e.g. `DATABASE`) when the attribute is obvious and there is no other environment variables that would make it ambiguous.
