

.PHONY: install/pacman
install/pacman:
	$(CURDIR)/install/pacman.sh




.PHONY: environment/env
environment/env: install/pacman
	$(CURDIR)/environment/env.sh

.PHONY: install
install: install/pacman
.PHONY: bootstrap
bootstrap: install environment/env
