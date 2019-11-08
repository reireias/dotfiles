.PHONY: dotfiles
dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml

.PHONY: dependencies
dependencies:
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml
	@$(MAKE) zplug

.PHONY: zplug
zplug:
	@if ! zsh -lc "zplug check"; then \
		zsh -lc "zplug install"; \
		if [ -e ~/.zcompdump ]; then \
			rm ~/.zcompdump; \
		fi; \
		if [ -e ~/.zplug/zcompdump ]; then \
			rm ~/.zplug/zcompdump; \
		fi; \
		zsh -lc "compinit"; \
	fi

.PHONY: test
test:
	@bash test.sh
