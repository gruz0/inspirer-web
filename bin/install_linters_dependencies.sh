#!/bin/bash

cp bin/pre-commit .git/hooks/pre-commit
gem install rubocop rubocop-rails rubocop-rspec rubocop-performance brakeman bundle-audit
