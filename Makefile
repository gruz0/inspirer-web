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
	docker-compose exec app sh

test:
	DATABASE_URL=postgresql://postgres@localhost/inspirer_test bundle exec rspec

install_linters:
	bin/install_linters_dependencies.sh
