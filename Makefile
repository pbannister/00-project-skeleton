#
#	Makefile to provide guidance.
#
# 	For CMake driven builds, this will:
#		* Invoke CMake to create the build directories
#		* Invoke CMake to do the build
#
#	For npm driven builds, this will invoke npm.
#

build:	# default rule

.PHONY: build clean test deploy install

build	: ; @echo '==== No build yet defined'
clean	: ; @echo '==== No clean yet defined'
test	: ; @echo '==== No tests yet defined'
deploy	: ; @echo '==== No deploy yet defined'
install	: ; @echo '==== No install yet defined'

# Create possibly empty directories.

dataset.in 	: ; mkdir $@
dataset.out	: ; mkdir $@
logs		: ; mkdir $@
site.in		: ; mkdir $@
site.out	: ; mkdir $@

build		: dataset.in
build		: dateset.out
build		: logs
build		: site.in
build		: site.out

