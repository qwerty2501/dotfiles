
.PHONY: target_platform_bootstrap
target_platform_bootstrap:
	$(CURDIR)/scripts/platform/$${TARGET_LSB}/init.sh

.PHONY: general_bootstrap
general_bootstrap:
	$(CURDIR)/scripts/general/init.sh


.PHONY: bootstrap
bootstrap: target_platform_bootstrap general_bootstrap
