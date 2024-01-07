## Composer (https://getcomposer.org/) recipes

# Variables
PHP_CONTAINER?=app
PHP?=$(DOCKER_COMPOSE) --env-file $(DOCKER_ENV_FILE) -f $(DOCKER_LOCAL_FILE) run --rm --no-deps $(PHP_CONTAINER)
NON_EXISTENT_DEPENDENCY?=put-dependency/name-here

# `comp` stands for `composer`

##--- Basic commands ---

.PHONY: compi
compi:
	@echo "Quietly installing dependencies via composer"
	$(PHP) composer install --no-interaction --ignore-platform-reqs --no-scripts --no-dev

.PHONY: compifull
compifull:
	@echo "Interactive installing dependencies via composer"
	$(PHP) composer install --no-dev

.PHONY: compidev
compidev:
	@echo "Installing dev-dependencies via composer"
	$(PHP) composer install --no-interaction --ignore-platform-reqs --no-scripts --dev

.PHONY: compupd
compupd:
	@echo "Updating dependencies via composer"
	$(PHP) composer update

.PHONY: compu
compu: compupd

.PHONY: compvld
compvld:
	@echo "Validating composer data"
	$(PHP) composer validate

.PHONY: compv
compv: compvld

.PHONY: compreq
compreq:
	@echo "Requiring dependency"
	$(PHP) composer require $(NON_EXISTENT_DEPENDENCY)

.PHONY: compreqdev
compreqdev:
	@echo "Requiring dev-dependency"
	$(PHP) composer require $(NON_EXISTENT_DEPENDENCY) --dev

.PHONY: comprm
comprm:
	@echo "Removing dependency via composer"
	$(PHP) composer remove $(NON_EXISTENT_DEPENDENCY)

.PHONY: comprmuu
comprmuu:
	@echo "Removing unused dependencies"
	$(PHP) composer remove --unused

##--- Specific commands, with certain package names ---

.PHONY: comprgql
comprgql:
	@echo "Requiring graphql/overblog via composer"
	$(PHP) composer require overblog/graphql-bundle

.PHONY: comprlock
comprlock:
	@echo "Requiring symfony/lock via composer"
	$(PHP) composer require symfony/lock

.PHONY: comprphpunit
comprphpunit:
	@echo "Requiring symfony/test-pack via composer"
	$(PHP) composer require --dev symfony/test-pack:*

.PHONY: comprpunit
comprpunit: comprphpunit
