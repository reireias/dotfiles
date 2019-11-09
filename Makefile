PYENV := $(shell which python | grep -o pyenv)
ifeq ($(PYENV),pyenv)
	ANSIBLE_ARG := --extra-vars ansible_python_interpreter=/usr/bin/python
endif

CHECK_SUDO := $(shell sudo -n true 2>&1 && echo OK)
ifeq ($(CHECK_SUDO),OK)
	ANSIBLE_SUDO_ARG :=
else
	ANSIBLE_SUDO_ARG := -K
endif

.PHONY: dotfiles
dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml $(ANSIBLE_ARG)

.PHONY: dependencies
dependencies:
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml $(ANSIBLE_ARG) $(ANSIBLE_SUDO_ARG)
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
