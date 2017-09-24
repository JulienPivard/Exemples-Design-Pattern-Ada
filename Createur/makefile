# vim: nofoldenable: list:
# PIVARD Julien
# Dernière modification : Dimanche 24 septembre[09] 2017

SHELL		= /bin/sh
.DEFAULT_GOAL	:= all
# Les suffixes des fichiers dont on va tenir compte
.SUFFIXES:

srcdir		= .

Makefiles		= $(wildcard */makefile)
Makefiles_Cleans	= $(Makefiles:%=%_clean)
Makefiles_DistClean	= $(Makefiles:%=%_distclean)


.PHONY: all
all: build


.PHONY: build
build: $(Makefiles)

$(Makefiles): force
	$(MAKE) -C $(dir $@)

.PHONY: clean
clean: $(Makefiles_Cleans)

$(Makefiles_Cleans): force
	$(MAKE) -C $(dir $(@:%_clean=%)) clean

.PHONY: distclean
distclean: $(Makefiles_DistClean)

$(Makefiles_DistClean) : force
	$(MAKE) -C $(dir $(@:%_distclean=%)) distclean


# Pour lancer les cibles des règles implicites
.PHONY: force
force:
