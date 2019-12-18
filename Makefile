# Use /bin/bash instead of /bin/sh
export SHELL = /bin/bash

## ========================================
## Commands for both workshop and lesson websites.

# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL_VERSION=3.8.5
JEKYLL=bundle install --path .vendor/bundle && bundle update && bundle exec jekyll
PARSER=bin/markdown_ast.rb
DST=_site

# Check Python 3 is installed and determine if it's called via python3 or python
# (https://stackoverflow.com/a/4933395)
PYTHON3_EXE := $(shell which python3 2>/dev/null)
ifneq (, $(PYTHON3_EXE))
  ifeq (,$(findstring Microsoft/WindowsApps/python3,$(subst \,/,$(PYTHON3_EXE))))
    PYTHON := python3
  endif
endif

ifeq (,$(PYTHON))
  PYTHON_EXE := $(shell which python 2>/dev/null)
  ifneq (, $(PYTHON_EXE))
    PYTHON_VERSION_FULL := $(wordlist 2,4,$(subst ., ,$(shell python --version 2>&1)))
    PYTHON_VERSION_MAJOR := $(word 1,${PYTHON_VERSION_FULL})
    ifneq (3, ${PYTHON_VERSION_MAJOR})
      $(error "Your system does not appear to have Python 3 installed.")
    endif
    PYTHON := python
  else
      $(error "Your system does not appear to have any Python installed.")
  endif
endif


# Controls
.PHONY : commands clean files

# Default target
.DEFAULT_GOAL := commands

## I. Commands for both workshop and lesson websites
## =================================================

## * serve            : render website and run a local server
serve : lesson-md
	${JEKYLL} serve

## * site             : build website but do not run a server
site : lesson-md
	${JEKYLL} build

## * docker-serve     : use Docker to serve the site
docker-serve :
	docker run --rm -it --volume ${PWD}:/srv/jekyll \
           --volume=${PWD}/.docker-vendor/bundle:/usr/local/bundle \
           -p 127.0.0.1:4000:4000 \
           jekyll/jekyll:${JEKYLL_VERSION} \
           bin/run-make-docker-serve.sh

## * repo-check       : check repository settings
repo-check :
	@${PYTHON} bin/repo_check.py -s .

## * clean            : clean up junk files
clean :
	@rm -rf ${DST}
	@rm -rf .sass-cache
	@rm -rf bin/__pycache__
	@find . -name .DS_Store -exec rm {} \;
	@find . -name '*~' -exec rm {} \;
	@find . -name '*.pyc' -exec rm {} \;

## * clean-rmd        : clean intermediate R files (that need to be committed to the repo)
clean-rmd :
	@rm -rf ${RMD_DST}
	@rm -rf fig/rmd-*


##
## II. Commands specific to workshop websites
## =================================================

.PHONY : workshop-check

## * workshop-check   : check workshop homepage
workshop-check :
	@${PYTHON} bin/workshop_check.py .


##
## III. Commands specific to lesson websites
## =================================================

.PHONY : lesson-check lesson-md lesson-files lesson-fixme

# RMarkdown files
RMD_SRC = $(wildcard _episodes_rmd/??-*.Rmd)
RMD_DST = $(patsubst _episodes_rmd/%.Rmd,_episodes/%.md,$(RMD_SRC))

# Lesson source files in the order they appear in the navigation menu.
MARKDOWN_SRC = \
  index.md \
  CODE_OF_CONDUCT.md \
  setup.md \
  $(sort $(wildcard _episodes/*.md)) \
  reference.md \
  $(sort $(wildcard _extras/*.md)) \
  LICENSE.md

# Generated lesson files in the order they appear in the navigation menu.
HTML_DST = \
  ${DST}/index.html \
  ${DST}/conduct/index.html \
  ${DST}/setup/index.html \
  $(patsubst _episodes/%.md,${DST}/%/index.html,$(sort $(wildcard _episodes/*.md))) \
  ${DST}/reference/index.html \
  $(patsubst _extras/%.md,${DST}/%/index.html,$(sort $(wildcard _extras/*.md))) \
  ${DST}/license/index.html

## * lesson-md        : convert Rmarkdown files to markdown
lesson-md : ${RMD_DST}

_episodes/%.md: _episodes_rmd/%.Rmd
	@bin/knit_lessons.sh $< $@

# * lesson-check     : validate lesson Markdown
lesson-check : lesson-fixme
	@${PYTHON} bin/lesson_check.py -s . -p ${PARSER} -r _includes/links.md

## * lesson-check-all : validate lesson Markdown, checking line lengths and trailing whitespace
lesson-check-all :
	@${PYTHON} bin/lesson_check.py -s . -p ${PARSER} -r _includes/links.md -l -w --permissive

## * unittest         : run unit tests on checking tools
unittest :
	@${PYTHON} bin/test_lesson_check.py

## * lesson-files     : show expected names of generated files for debugging
lesson-files :
	@echo 'RMD_SRC:' ${RMD_SRC}
	@echo 'RMD_DST:' ${RMD_DST}
	@echo 'MARKDOWN_SRC:' ${MARKDOWN_SRC}
	@echo 'HTML_DST:' ${HTML_DST}

## * lesson-fixme     : show FIXME markers embedded in source files
lesson-fixme :
	@fgrep -i -n FIXME ${MARKDOWN_SRC} || true

##
## IV. Auxililary (plumbing) commands
## =================================================

## * commands         : show all commands.
commands :
	@sed -n -e '/^##/s|^##[[:space:]]*||p' $(MAKEFILE_LIST)
