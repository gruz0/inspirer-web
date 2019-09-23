#!/bin/sh

rm -f tmp/pids/server.pid
bin/rails s --binding 0.0.0.0
