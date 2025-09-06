

.PHONY: install/base_apt
install/base_apt:
	$(CURDIR)/install/base_apt.sh
.PHONY: install/apt
install/apt: install/base_apt
	$(CURDIR)/install/apt.sh

.PHONY: install/docker
install/docker: install/apt
	$(CURDIR)/install/docker.sh



.PHONY: environment/env
environment/env: install/apt
	$(CURDIR)/environment/env.sh

.PHONY: install
install: install/docker  install/apt install/base_apt 
.PHONY: bootstrap
bootstrap: install environment/env
