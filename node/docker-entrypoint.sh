#!/bin/sh

set -e

# Add node as command if needed
if [ "${1:0:1}" = '-' ]; then
  set -- node "$@"
fi

# Drop root privileges if we are running npm
# allow the container to be started with `--user`
if [ "$1" = 'npm' -a "$(id -u)" = '0' ]; then
  set -- su-exec npm "$@"
fi

# Drop root privileges if we are running node
# allow the container to be started with `--user`
if [ "$1" = 'node' -a "$(id -u)" = '0' ]; then
  set -- su-exec node "$@"
fi

# As argument is not related to node,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"
