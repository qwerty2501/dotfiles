.PHONY: install/nodejs
install/nodejs:
	$(CURDIR)/scripts/install/nodejs.sh

.PHONY: install/node_tools
install/node_tools:
	$(CURDIR)/scripts/install/node_tools.sh

.PHONY: install/base_apt
install/base_apt:
	install/base_apt.sh
.PHONY: install/apt
install/apt: install/base_apt
	$(CURDIR)/scripts/install/apt.sh

.PHONY: install/docker
install/docker:
	$(CURDIR)/scripts/install/docker.sh


.PHONY: install/rust
install/rust:
	$(CURDIR)/scripts/install/rust.sh

.PHONY: install/cargo_tools
install/cargo_tools: install/rust
	$(CURDIR)/scripts/install/cargo_tools.sh

.PHONY: install/rustup_components
install/rustup_components: install/rust
	$(CURDIR)/scripts/install/rustup_components.sh

.PHONY: environment/env
environment/env: install/apt
	$(CURDIR)/scripts/environment/env.sh

.PHONY: bootstrap
bootstrap: install/docker install/cargo_tools install/node_tools install/apt install/rustup_components install/cargo_tools environment/env
