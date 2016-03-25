SRC = $(wildcard src/**/*.coffee)

lint: $(SRC) $(wildcard *.coffee)
	@coffeelint -cq $^

clean:
	@rm -rf dist/*

build: lint
	@webpack --optimize-dedupe --optimize-occurence-order

all: build
.PHONY: lint doc clean build all
