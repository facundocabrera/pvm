# PVM - PHP version manager

## Installation

1. `git clone git://github.com/dendril/pvm.git`
2. `export PATH="$(pwd)/pvm/bin":$PATH`

## Documentation

The command `pvm` includes all the information inside. Run `pvm` for more information.

## Directory structure

- root(PVM)
    + core/
        - config (global conf file with paths and constants)
        - versions (list of available php versions)
    + modules/
        - confirm (confirm message fn)
        - macro (macro replacement %%MARK%%)
        - php (general bash fn)
        - main (pvm arg parsing + fn calls)
    + cache/
        - cache directory
    + tmp/
        - compilation tmp directory
    + pvm (pvm script)
