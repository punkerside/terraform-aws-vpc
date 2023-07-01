GIT_OWNER  = punkerside
GIT_REPO   = titan-core
GIT_PATH   = script
GIT_BRANCH = main
REP_HOME   = $(shell echo "$(shell pwd | rev | cut -d "/" -f1 | rev)")

# configurando directorio
ifeq ($(REP_HOME),${GIT_REPO})
GIT_HOME = $(shell echo "$(PWD)")
else
GIT_HOME = $(shell echo "$(PWD)/.${GIT_PATH}")
endif

init:
	@rm -rf .${GIT_PATH}/
	@git clone git@github.com:${GIT_OWNER}/${GIT_REPO}.git -b ${GIT_BRANCH} .${GIT_PATH}

# necesario para validaciones del repositorio titan
-include makefiles/*.mk

# necesario para la carga de procesos en repositorios clientes
-include .${GIT_PATH}/makefiles/*.mk