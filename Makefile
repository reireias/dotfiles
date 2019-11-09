.PHONY: dotfiles
dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml

.PHONY: dependencies
dependencies:
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml
	# TODO: set ansible_python_interpreter=/usr/bin/python if use pyenv
	@$(MAKE) zplug

.PHONY: zplug
zplug:
	@if ! zsh -ic "zplug check"; then \
		zsh -ic "zplug install"; \
		if [ -e ~/.zcompdump ]; then \
			rm ~/.zcompdump; \
		fi; \
		if [ -e ~/.zplug/zcompdump ]; then \
			rm ~/.zplug/zcompdump; \
		fi; \
		zsh -ic "compinit"; \
	fi

.PHONY: test
test:
	@bash test.sh
