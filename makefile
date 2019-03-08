# vim: nofoldenable: list:
# PIVARD Julien
# Dernière modification : Vendredi 08 mars[03] 2019

SHELL		= /bin/sh
.DEFAULT_GOAL	:= all
# Les suffixes des fichiers dont on va tenir compte
.SUFFIXES:

srcdir		= .

Makefiles		= $(wildcard */makefile)
Makefiles_Cleans	= $(Makefiles:%=%_clean)
Makefiles_DistClean	= $(Makefiles:%=%_distclean)
Makefiles_Version	= $(Makefiles:%=%_version)
Makefiles_Run		= $(Makefiles:%=%_run)


###################
.PHONY: all
all: build


###################
.PHONY: build
build: $(Makefiles)

###################
$(Makefiles): force
	$(MAKE) -C $(dir $@)

###################
.PHONY: run
run: $(Makefiles_Run)

###################
$(Makefiles_Run):
	$(MAKE) -C $(dir $@) run

###################
.PHONY: clean
clean: $(Makefiles_Cleans)

###################
$(Makefiles_Cleans): force
	$(MAKE) -C $(dir $(@:%_clean=%)) clean

###################
.PHONY: distclean
distclean: $(Makefiles_DistClean)

###################
$(Makefiles_DistClean) : force
	$(MAKE) -C $(dir $(@:%_distclean=%)) distclean


###################
.PHONY: version_makefile
version_makefile: $(Makefiles_Version)

###################
$(Makefiles_Version) : force
	$(MAKE) -C $(dir $(@:%_version=%)) version_makefile


# Pour lancer les cibles des règles implicites
###################
.PHONY: force
force:
