SHELL := /bin/bash

#COLOURED ECHO
green = $(shell echo -e '\x1b[32;01m$1\x1b[0m')
yellow = $(shell echo -e '\x1b[33;01m$1\x1b[0m')
red = $(shell echo -e '\x1b[33;31m$1\x1b[0m')

#HELP COLORS
GREEN := $(shell tput -Txterm setaf 2)
WHITE := $(shell tput -Txterm setaf 7)
YELLOW := $(shell tput -Txterm setaf 3)
RED := $(shell tput -Txterm setaf 1)
RESET := $(shell tput -Txterm sgr0)

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
# A category can be added with @category
HELP_FUN = \
%help; \
while(<>) { push @{$$help{$$2 // 'options'}}, [$$1, $$3] if /^([a-zA-Z\-\.]+)\s*:.*\#\#(?:@([a-zA-Z\-]+))?\s(.*)$$/ }; \
print "usage: make [target]\n\n"; \
for (sort keys %help) { \
print "${RED}$$_:${RESET}\n"; \
for (@{$$help{$$_}}) { \
$$sep = " " x (32 - length $$_->[0]); ($$command = $$_->[0]) =~ s/\\//g; $$description = $$_->[1]; \
print " ${YELLOW}make${RESET} ${GREEN}$$command${RESET}$$sep${WHITE}$$description${RESET}\n"; \
}; \
print "\n"; }
#HELP COLORS END

all: $(MAKEFILE_LIST)
.PHONY: all

.DEFAULT_GOAL:=help

#To create new command you should use pattern as described below:
# COMMAND_NAME: ##@CATEGORY_NAME DESCRIPTION_TEXT
#Applied DOT (.) for logical separation.

help: ##@OTHER Show this help
	@perl -e '$(HELP_FUN)' $(MAKEFILE_LIST)

php.bash: ##@APP enter docker php container
	docker compose exec -ti php bash

symfony.up:  ##@DOCKER up all docker containers
	docker compose up -d
	docker compose ps

symfony.d:  ##@DOCKER down all docker containers
	docker compose down