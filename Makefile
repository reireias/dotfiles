.PHONY: dotfiles
dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml

.PHONY: dependencies
dependencies:
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml

.PHONY: test
test:
	@bash test.sh
