.PHONY: help setup test zip

help:
	@echo "Cibles disponibles :"
	@echo "  make setup  - initialise le lab dans ~/novacorp"
	@echo "  make test   - vérifie les scripts"
	@echo "  make zip    - crée une archive du dépôt"

setup:
	./scripts/setup_lab.sh

test:
	bash tests/test_scripts.sh

zip:
	cd .. && zip -r formation-bash-linux-admin.zip formation-bash-linux-admin -x "*.git*"
