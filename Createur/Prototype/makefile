# vim: nofoldenable: list:
# PIVARD Julien
# Dernière modification : Jeudi 14 septembre[09] 2017

SHELL		= /bin/sh
.DEFAULT_GOAL	:= all
# Les suffixes des fichiers dont on va tenir compte
.SUFFIXES:

srcdir		= .

include ./makefile.conf
include ./makefile.checks
include ./makefile.template

###################
.PHONY: $(CIBLECOMPILE)
$(CIBLECOMPILE): build
	@echo "───────────────────────────────"
	@echo "[OK] Compilation du programme : [ $(NOMAPP) ] terminé"
	@echo

###################
.PHONY: help
help:
	@echo "Liste des commandes :"
	@echo " - all		: Compile l'application."
	@echo "    - build"
	@echo "    - $(CIBLECOMPILE)"
	@echo " - run		: Execute l'application avec les paramètres défini."
	@echo " - clean	: Efface tous les fichiers généré par le compilateur sauf les exécutables."
	@echo " - distclean	: Efface tous les fichiers généré par le compilateur."
