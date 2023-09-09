.PHONY: install/nodejs
install/nodejs:
	$(CURDIR)/scripts/install/nodejs.sh

.PHONY: install/node_tools
install/node_tools: install/nodejs
	$(CURDIR)/scripts/install/node_tools.sh

.PHONY: install/base_apt
install/base_apt:
	$(CURDIR)/scripts/install/base_apt.sh
.PHONY: install/apt
install/apt: install/base_apt
	$(CURDIR)/scripts/install/apt.sh

.PHONY: install/docker
install/docker: install/apt
	$(CURDIR)/scripts/install/docker.sh


.PHONY: install/rust
install/rust: install/base_apt
	$(CURDIR)/scripts/install/rust.sh

.PHONY: install/rustup_components
install/rustup_components: install/rust
	$(CURDIR)/scripts/install/rustup_components.sh

.PHONY: install/cargo_tools
install/cargo_tools: install/rustup_components
	$(CURDIR)/scripts/install/cargo_tools.sh

.PHONY: install/oh-my-bash
install/oh-my-bash: install/base_apt
	$(CURDIR)/scripts/install/oh-my-bash.sh

.PHONY: install/nerd_fonts
install/nerd_fonts:
	$(CURDIR)/scripts/install/nerd_fonts.sh

.PHONY: install/neovim
install/neovim:
	$(CURDIR)/scripts/install/neovim.sh





.PHONY: environment/env
environment/env: install/apt
	$(CURDIR)/scripts/environment/env.sh

.PHONY: install
install: install/docker install/cargo_tools install/node_tools install/apt install/rustup_components install/cargo_tools install/oh-my-bash install/neovim install/nerd_fonts
.PHONY: bootstrap
bootstrap: install environment/env
