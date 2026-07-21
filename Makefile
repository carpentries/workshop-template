## ========================================
## Commands for both workshop and lesson websites.

# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL=bundle config set --local path .vendor/bundle && bundle install && bundle update && bundle exec jekyll
PARSER=bin/markdown_ast.rb
DST=_site

# Check Python 3 is installed and determine if it's called via python3 or python
# (https://stackoverflow.com/a/4933395)
PYTHON3_EXE := $(shell which python3 2>/dev/null)
ifneq (, $(PYTHON3_EXE))
  ifeq (,$(findstring Microsoft/WindowsApps/python3,$(subst \,/,$(PYTHON3_EXE))))
    PYTHON := $(PYTHON3_EXE)
  endif
endif

ifeq (,$(PYTHON))
  PYTHON_EXE := $(shell which python 2>/dev/null)
  ifneq (, $(PYTHON_EXE))
    PYTHON_VERSION_FULL := $(wordlist 2,4,$(subst ., ,$(shell python --version 2>&1)))
    PYTHON_VERSION_MAJOR := $(word 1,${PYTHON_VERSION_FULL})
    ifeq (3, ${PYTHON_VERSION_MAJOR})
      PYTHON := $(PYTHON_EXE)
    else
      PYTHON_NOTE = "Your system does not appear to have Python 3 installed."
    endif
  else
      PYTHON_NOTE = "Your system does not appear to have any Python installed."
  endif
endif


# Default target
.DEFAULT_GOAL := commands

## I. Commands for both workshop and lesson websites
## =================================================

.PHONY: site clean

## * serve            : render website and run a local server
serve : index.md
	${JEKYLL} serve

## * site             : build website but do not run a server
site : index.md
	${JEKYLL} build

## * clean            : clean up junk files
clean :
	@rm -rf ${DST}
	@rm -rf .sass-cache
	@rm -rf bin/__pycache__
	@rm -rf .vendor
	@rm -rf .bundle
	@rm -f Gemfile.lock
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
	@find . -name '*.pyc' -exec rm {} \;


##
## II. Commands specific to workshop websites
## =================================================

.PHONY : workshop-check

## * workshop-check   : check workshop homepage
workshop-check : python
	@${PYTHON} bin/workshop_check.py .

##
## III. Commands specific to lesson websites
## =================================================

.PHONY : workshop-files

# Workshop source files in the order they appear in the navigation menu.
MARKDOWN_SRC = \
  index.md \
  CODE_OF_CONDUCT.md \
  setup.md \
  reference.md \
  $(sort $(wildcard _extras/*.md)) \
  LICENSE.md

# Generated workshop files in the order they appear in the navigation menu.
HTML_DST = \
  ${DST}/index.html \
  ${DST}/conduct/index.html \
  ${DST}/setup/index.html \
  ${DST}/reference.html \
  $(patsubst _extras/%.md,${DST}/%/index.html,$(sort $(wildcard _extras/*.md))) \
  ${DST}/license/index.html

## * workshop-files     : show expected names of generated files for debugging
workshop-files :
	@echo 'MARKDOWN_SRC:' ${MARKDOWN_SRC}
	@echo 'HTML_DST:' ${HTML_DST}

## * workshop-fixme     : show FIXME markers embedded in source files
workshop-fixme :
	@grep --fixed-strings --word-regexp --line-number --no-messages FIXME ${MARKDOWN_SRC} || true


##
## IV. Auxililary (plumbing) commands
## =================================================

.PHONY : commands python

## * commands         : show all commands.
commands :
	@sed -n -e '/^##/s|^##[[:space:]]*||p' $(MAKEFILE_LIST)

python :
ifeq (, $(PYTHON))
	$(error $(PYTHON_NOTE))
else
	@:
endif

index.md :
ifeq (, $(wildcard index.md))
	$(error index.md not found)
else
	@:
endif
