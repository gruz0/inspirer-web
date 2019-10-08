.PHONY: help dockerize shell test install_linters

help:
	@echo 'Available targets:'
	@echo '  make dockerize'
	@echo '  make shell'
	@echo '  make test'
	@echo '  make install_linters'

dockerize:
	docker-compose up --build

shell:
	docker-compose exec app bash

test:
	DB_HOST=localhost rspec

install_linters:
	bin/install_linters_dependencies.sh
