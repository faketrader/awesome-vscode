# Makefile for awesome-vscode extension packs

PACKS := core-pack ai-pack document-pack java-pack python-pack web-pack extra-pack
PACKAGE_TARGETS := $(PACKS:%=package-%)
INSTALL_TARGETS := $(PACKS:%=install-%)
PUBLISH_TARGETS := $(PACKS:%=publish-%)
JOBS ?= $(shell sysctl -n hw.ncpu 2>/dev/null || nproc 2>/dev/null || echo 4)
MAKEFLAGS += -j$(JOBS) --output-sync=target

# Default target
.PHONY: all
all: package

.PHONY: all package install publish clean $(PACKAGE_TARGETS) $(INSTALL_TARGETS) $(PUBLISH_TARGETS)

# Target to package all extensions
package: $(PACKAGE_TARGETS)
	@echo "Packaging complete."

# Target to install all extensions
install: $(INSTALL_TARGETS)
	@echo "Installation complete."

# Target to publish all extensions
publish: $(PUBLISH_TARGETS)
	@echo "Publishing complete."

# Target to clean packaged files (optional)
clean:
	@echo "Cleaning packaged files..."
	rm -f **/*.vsix
	@echo "Cleaning complete."

define PACK_RULES
package-$(1):
	@echo "Packaging $(1)..."
	cd $(1)/ && vsce package

install-$(1): package-$(1)
	@echo "Installing $(1)..."
	cd $(1)/ && code --install-extension *.vsix --force

publish-$(1):
	@echo "Publishing $(1)..."
	cd $(1)/ && vsce publish
endef

$(foreach pack,$(PACKS),$(eval $(call PACK_RULES,$(pack))))
