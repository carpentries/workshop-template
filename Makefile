# Settings
MAKEFILES=Makefile $(wildcard *.mk)
JEKYLL=jekyll # or 'bundle exec jekyll'

all : commands

## commands   : show all commands.
commands :
	@grep -h -E '^##' ${MAKEFILES} | sed -e 's/## //g'

## serve      : run a local server.
serve :
	${JEKYLL} serve --config _config.yml,_config_dev.yml

## site       : build files but do not run a server.
site :
	${JEKYLL} build --config _config.yml

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
