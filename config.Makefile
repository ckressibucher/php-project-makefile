# === Should only contain the variables for the Makefile ====

# May be useful if you want to test with a different php version
# (note that variables can also be overwritten in cli argument)
PHP_BIN             := php

# how to run composer (you can also use `$(PHP_BIN) composer.phar`
# to make sure composer uses the project's php binary)
COMPOSER_BIN        := composer

# phan needs php v7.0 (and the ast extension)
PHAN_BIN            := php70 ~/bin/phan
NUM_OF_PROC         := 4

# PHP's built-in dev server runs on this address
DEV_SERVER_ADDR     := 127.0.0.1:8080

# the public directory (document root)
PUBLIC_DIR          := public

# used for PID (process id) files, dev server logs, ...
TMP_DIR             := tmp-dev

# a list of directories containing *your* sources
# (not vendor)
SRCS                := src $(PUBLIC_DIR)
