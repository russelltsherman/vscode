-include $(shell curl -sSL -o .build-harness "https://raw.githubusercontent.com/russelltsherman/build-harness/master/templates/Makefile.build-harness"; echo .build-harness)

current_dir = $(shell pwd)

## load dependencies for this project
bootstrap: init
	ln -sv $(current_dir)/.vscode/ ~/.vscode
	make brew
	make vscode
_PHONY: bootstrap

## load Visual Studio Code extensions from manifest file
vscode:
	@while IFS= read -r LINE; do code --install-extension "$$LINE"; done < ./.vscode/.extensions-manifest
	@mkdir -p ~/Library/Application\ Support/Code/User/
	@ln -sv ~/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
.PHONY: vscode

## write Visual Studio Code extensions to manifest file
vscode/backup:
	code --list-extensions > ./.vscode/.extensions-manifest
.PHONY: vscode/backup
