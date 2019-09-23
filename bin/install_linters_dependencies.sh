#!/bin/bash

cp bin/pre-commit .git/hooks/pre-commit
gem install rubocop rubocop-rspec bundler-audit brakeman
