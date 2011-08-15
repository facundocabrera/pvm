# PVM - PHP version manager

## Directory structure

- $HOME/.pvm/
  + core/
    - config   <- global conf file with paths and constants
    - versions <- list of available php versions
  + modules/
    - confirm  <- confirm message fn
    - macro    <- macro replacement %%MARK%% 
    - php      <- general bash fn 
    - main     <- pvm arg parsing + fn calls
  + cache/
    - cache directory
  + tmp/
    - compilation tmp directory
  + pvm        <- pvm script

