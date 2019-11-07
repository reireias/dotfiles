.PHONY: dotfiles
dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml

.PHONY: dependencies
dependencies:
	@bash initialize.sh

.PHONY: test
test:
	@bash test.sh
