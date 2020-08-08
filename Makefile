-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/russelltsherman/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)

## load dependencies for this project
bootstrap: 
	make brew
	ln -sv $(current_dir)/.vscode/ ~/.vscode
_PHONY: bootstrap
