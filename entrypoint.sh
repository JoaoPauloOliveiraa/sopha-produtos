#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /crud-sopha/tmp/pids/server.pid
bundle check || bundle install
exec "$@"
