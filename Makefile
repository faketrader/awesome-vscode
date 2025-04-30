# Makefile for awesome-vscode extension packs

# Default target
.PHONY: all
all: package

# Target to package all extensions
.PHONY: package
package:
	@echo "Packaging extensions..."
	cd core-pack/ && vsce package
	cd ai-pack/ && vsce package
	cd document-pack/ && vsce package
	cd java-pack/ && vsce package
	cd python-pack/ && vsce package
	cd web-pack/ && vsce package
	cd extra-pack/ && vsce package
	@echo "Packaging complete."

# Target to install all extensions
.PHONY: install
install:
	@echo "Installing extensions..."
	cd core-pack/ && code --install-extension *.vsix --force
	cd ai-pack/ && code --install-extension *.vsix --force
	cd document-pack/ && code --install-extension *.vsix --force
	cd java-pack/ && code --install-extension *.vsix --force
	cd python-pack/ && code --install-extension *.vsix --force
	cd web-pack/ && code --install-extension *.vsix --force
	cd extra-pack/ && code --install-extension *.vsix --force
	@echo "Installation complete."

# Target to publish all extensions
.PHONY: publish
publish:
	@echo "Publishing extensions..."
	cd core-pack/ && vsce publish
	cd ai-pack/ && vsce publish
	cd document-pack/ && vsce publish
	cd java-pack/ && vsce publish
	cd python-pack/ && vsce publish
	cd web-pack/ && vsce publish
	cd extra-pack/ && vsce publish
	@echo "Publishing complete."

# Target to clean packaged files (optional)
.PHONY: clean
clean:
	@echo "Cleaning packaged files..."
	rm -f */*.vsix
	@echo "Cleaning complete."
