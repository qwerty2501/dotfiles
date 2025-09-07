

.PHONY: install/pacman
install/pacman:
	$(CURDIR)/install/pacman.sh




.PHONY: environment/env
environment/env: install/pacman
	$(CURDIR)/environment/env.sh

.PHONY: install
install: install/docker  install/apt
.PHONY: bootstrap
bootstrap: install environment/env
