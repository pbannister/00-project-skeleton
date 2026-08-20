#
#	Makefile for the project skeleton.
#
#	This Makefile is the human-facing driver.
#	Each rule calls the appropriate tool instead of reimplementing work:
#		build:  sh scripts/site-build.sh
#		clean:  rm generated output
#		test:   npm test
#		deploy, install: reserved; not yet defined.
#

build:
	sh scripts/site-build.sh

clean:
	rm -f dataflow.out/* site.out/* logs/*

test:
	npm test

deploy:
	@echo '==== No deploy yet defined'

install:
	@echo '==== No install yet defined'

.PHONY: build clean test deploy install
