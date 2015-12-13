# Settings
MAKEFILES=Makefile $(wildcard *.mk)
CONFIG=--config _config.yml,_config_dev.yml

all : commands

## commands   : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILES} | sed -e 's/## //g'

## serve      : run a local server.
serve :
	bundle exec jekyll serve ${CONFIG}

## build      : build files but do not run a server.
build :
	bundle exec jekyll build ${CONFIG}

## install    : install missing Ruby gems using bundle.
install :
	bundle install

## clean      : clean up junk files.
clean :
	rm -rf _site
	rm -rf .sass-cache
	find . -name .DS_Store -exec rm {} \;
	find . -name '*~' -exec rm {} \;
	find . -name '*.pyc' -exec rm {} \;

# Include extra commands if available.
-include commands.mk
