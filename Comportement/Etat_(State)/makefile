# vim: nofoldenable: list:
# PIVARD Julien
# Dernière modification : Lundi 29 septembre[09] 2025

SHELL		:= /bin/sh
.DEFAULT_GOAL	:= all
# Les suffixes des fichiers dont on va tenir compte
.SUFFIXES:

srcdir		:= .

DOSSIER_MAKE	:= dossier_makefiles

include ./$(DOSSIER_MAKE)/makefile.fixe
ifeq ($(wildcard makefile.conf), )
    include ./$(DOSSIER_MAKE)/makefile.conf.tmpl
else
    include ./makefile.conf
endif
include ./$(DOSSIER_MAKE)/makefile.checks
include ./$(DOSSIER_MAKE)/makefile.template

# Vérifie si le binaire existe. Sinon il ajoute
# la cible de compilation en dépendance.
ifeq ($(wildcard $(RESLT_COMPIL)), )
    DEPEND	= compiler
else
    DEPEND	=
endif

# Vérifie si le binaire existe. Sinon il ajoute
# la cible de compilation en dépendance.
ifeq ($(wildcard $(RESLT_COMPIL_PROD)), )
    DEPEND_PROD	= prod
else
    DEPEND_PROD	=
endif

###################
.PHONY: run
run: $(DEPEND)
	$(RESLT_COMPIL) $(ARGUMENTS_APPLI)

###################
.PHONY: run_prod
run_prod: $(DEPEND_PROD)
	$(RESLT_COMPIL_PROD) $(ARGUMENTS_APPLI)

###################
.PHONY: resultat_build
resultat_build:
	@echo " ─────────────────────────────────────────────────────────────────"
	@echo " Résultat écrit dans [$(RESLT_COMPIL)] en mode [ $(shell echo $(MODE) | tr '[:lower:]' '[:upper:]') ]"
	@echo " ─────────────────────────────────────────────────────────────────"

###################
.PHONY: resultat_build_prod
resultat_build_prod:
	@echo " ─────────────────────────────────────────────────────────────────"
	@echo " Résultat écrit dans [$(RESLT_COMPIL_PROD)]"

###################
$(DOSSIER_MAKE)/makefile.conf.tmpl:

###################
makefile.conf: $(DOSSIER_MAKE)/makefile.conf.tmpl
	$(COPIE) ./$(DOSSIER_MAKE)/makefile.conf.tmpl ./makefile.conf
	$(CHANGE_DROITS) u+w ./makefile.conf
	@echo " "

###################
.PHONY: compiler
compiler: makefile.conf avant_build build resultat_build
	@echo " ───────────────────────────────"
	@echo " [OK] Compilation du programme : [ $(NOM_APP) ] terminé"
	@echo "  "

###################
.PHONY: prod
prod: makefile.conf avant_build build_prod resultat_build_prod
	@echo " ─────────────────────────────────────────────────────────────────"

###################
.PHONY: build
build:
	$(CC) $(VERBOSITE_ANALYSE_GPR) -P$(GPR) $(SCENARIOS_GPR)

###################
.PHONY: build_prod
build_prod:
	$(CC) $(VERBOSITE_ANALYSE_GPR) -P$(GPR) $(SCENARIOS_GPR_PROD)

###################
.PHONY: doc
doc: makefile.conf $(FAIRE_INITIALISATION)
	$(WHICH) $(GNAT_DOC)
	$(GNAT_DOC) -P$(GPR) $(SCENARIOS_GPR) $(OPT_DOCUMENT)

###################
.PHONY: prove
prove: makefile.conf $(FAIRE_INITIALISATION)
	$(WHICH) $(GNATPROVE)
	$(GNATPROVE) -P$(GPR) $(SCENARIOS_GPR) $(NIVEAU) $(RAPPORT) $(MODE_EXE)

###################
.PHONY: check
check: makefile.conf $(FAIRE_INITIALISATION)
	$(WHICH) $(GNATCHECK)
	$(GNATCHECK) -P$(GPR) $(SCENARIOS_GPR) $(OPT_CHECK)

###################
.PHONY: pretty
pretty: makefile.conf $(FAIRE_INITIALISATION)
	$(WHICH) $(GNATPP)
	$(GNATPP) -P$(GPR) $(Fichier)

###################
.PHONY: cleandoc
cleandoc: makefile.conf
	$(RM) $(OPT_RM) doc

###################
.PHONY: help
help: makefile.conf
	@echo "Liste des commandes :"
	@echo " - all			: Compile l'application."
	@echo "    - compiler"
	@echo " - prod			: Compile avec l'option release active."
	@echo " - run			: Execute l'application avec les paramètres défini."
	@echo " - runprod		: Execute l'application de prod avec les paramètres défini."
	@echo " - doc			: Génère la documentation du programme."
	@echo " "
	@echo " - clean 		: Efface tous les fichiers généré par le compilateur sauf les exécutables."
	@echo " - distclean		: Efface tous les fichiers généré par le compilateur."
	@echo " - cleandoc		: Supprime la documentation généré."
	@echo " "
	@echo " -  check		: Lance la vérification des règles de programmation sur les sources."
	@echo " -  prove		: Exécute l'outil gnatprove sur les fichiers sources."
	@echo " - pretty		: Reformate le fichier désigné par Fichier=/nom/du/fichier."
	@echo " "
	@echo " - compter		: Compte le nombre de lignes de code source."
	@echo "    - avec_find"
	@echo "    - avec_cloc"
	@echo " - compter_detail	: Compte le nombre de lignes de code source par fichier."
	@echo "    - avec_find_detail"
	@echo "    - avec_cloc_detail"
	@echo " "
	@echo " - maj_sous_modules	: Met à jour les sous modules"
	@echo " "
	@echo " - version_makefile	: La version des makefiles."
