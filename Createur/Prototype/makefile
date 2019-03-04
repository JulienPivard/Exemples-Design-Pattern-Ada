# vim: nofoldenable: list:
# PIVARD Julien
# Dernière modification : Lundi 04 mars[03] 2019

SHELL		:= /bin/sh
.DEFAULT_GOAL	:= all
# Les suffixes des fichiers dont on va tenir compte
.SUFFIXES:

srcdir		:= .

include ./makefile.conf
include ./makefile.checks
include ./makefile.template

###################
.PHONY: $(CIBLECOMPILE)
$(CIBLECOMPILE): build
	@echo " ───────────────────────────────"
	@echo " [OK] Compilation du programme : [ $(NOMAPP) ] terminé"
	@echo "  "

###################
.PHONY: doc
doc:
	gnatdoc -P$(GPR) $(OPTGPR) $(OPTDOCUMENT)

###################
.PHONY: prove
prove:
	gnatprove -P$(GPR) $(OPTGPR)

###################
.PHONY: check
check:
	gnatcheck -P$(GPR) $(OPTGPR) $(OPT_CHECK)

###################
.PHONY: cleandoc
cleandoc:
	$(RM) $(OPTRM) doc

###################
.PHONY: help
help:
	@echo "Liste des commandes :"
	@echo " - all		: Compile l'application."
	@echo "    - build"
	@echo "    - $(CIBLECOMPILE)"
	@echo " - doc		: Génère la documentation du programme."
	@echo " - cleandoc	: Supprime la documentation généré."
	@echo " - run		: Execute l'application avec les paramètres défini."
	@echo " - clean	: Efface tous les fichiers généré par le compilateur sauf les exécutables."
	@echo " - distclean	: Efface tous les fichiers généré par le compilateur."
