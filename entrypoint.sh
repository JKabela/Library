#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /tmp/pids/server.pid

bundle install

rake db:create && rake db:migrate && service cron start

su - rails

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"