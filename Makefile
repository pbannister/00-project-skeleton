#
#	Makefile for the project skeleton.
#
#	build: generate the static site in site.out/ from site.in/.
#	clean: remove generated output.
#	test:  run every test in tests/ in order; stop at the first failure.
#	deploy, install: reserved; not yet defined.
#

build:
	sh scripts/build-site.sh

clean:
	rm -f dataflow.out/* site.out/* logs/*

test:
	@for test in tests/*.sh; do \
		echo "=== $$test"; \
		sh "$$test" || exit 1; \
	done

deploy:
	@echo '==== No deploy yet defined'

install:
	@echo '==== No install yet defined'

.PHONY: build clean test deploy install
