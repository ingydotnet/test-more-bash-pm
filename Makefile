SHELL := bash

ROOT := $(shell pwd)

ZILD := \
    clean \
    cpan \
    cpanshell \
    dist \
    distdir \
    distshell \
    disttest \
    install \
    release \
    update \

test ?= test/

export PATH := $(ROOT)/bin:$(PATH)

#------------------------------------------------------------------------------
default:

.PHONY: test
test:
	prove -Ilib -v $(test)

$(ZILD):
	zild $@
