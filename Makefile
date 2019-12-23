PROJECTNAME := $(shell basename "$(PWD)")
all: help

target/debug/$(PROJECTNAME): src/main.rs
	cargo build

target/release/$(PROJECTNAME): src/main.rs
	cargo build --release

## build: build debug executable
build: target/debug/$(PROJECTNAME)

## build-release: build release executable
build-release: target/release/$(PROJECTNAME)

.PHONY: all help

## help: print this
help: Makefile
	@echo
	@echo " Choose a command run in "$(PROJECTNAME)":"
	@echo
	@sed -n 's/^##//p' $< | column -t -s ':' |  sed -e 's/^/ /'
	@echo