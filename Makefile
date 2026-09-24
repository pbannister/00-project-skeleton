#
#	Makefile for the project skeleton.
#
#	This Makefile is the human-facing driver.
#	Each rule calls the appropriate tool instead of reimplementing work:
#		build:  sh scripts/site-build.sh
#		site:   sh scripts/site-build.sh + sh scripts/site-condense.sh
#		        (the standard page set; see prompts/features/02-project-pages.md)
#		state:  sh scripts/site-state-fetch.sh (refresh the live state file;
#		        run on the owning host)
#		clean:  rm generated output
#		test:   npm test
#		deploy: RETIRED - all publishing to labs.bannister.us goes through
#		        the homelab project (homelab-publish; see the homelab's
#		        documents/09-project-pages-conventions.md). This target
#		        only reminds you of that; use the homelab's make deploy.
#		install: reserved; not yet defined.
#

build:
	sh scripts/site-build.sh

site:
	sh scripts/site-build.sh
	sh scripts/site-condense.sh

state:
	sh scripts/site-state-fetch.sh

clean:
	rm -f dataflow.out/* site.out/* logs/*

test:
	npm test

deploy:
	@echo '==== RETIRED: publishing goes through the homelab project (homelab-publish).'
	@echo '==== Build the pages here (make site / make state), then run the homelab''s "make deploy"'
	@echo '==== to publish (see homelab documents/09-project-pages-conventions.md).'

install:
	@echo '==== No install yet defined'

.PHONY: build site state clean test deploy install
