


.PHONY: install/rust
install/rust:
	$(CURDIR)/install/rust.sh

.PHONY: install/rustup_components
install/rustup_components: install/rust
	$(CURDIR)/install/rustup_components.sh

.PHONY: install/oh-my-bash
install/oh-my-bash:
	$(CURDIR)/install/oh-my-bash.sh

.PHONY: install/fonts
install/fonts:
	$(CURDIR)/install/fonts.sh

.PHONY: install/neovim
install/neovim:
	$(CURDIR)/install/neovim.sh






.PHONY: install
install: install/rustup_components install/oh-my-bash install/neovim install/fonts
.PHONY: bootstrap
bootstrap: install
