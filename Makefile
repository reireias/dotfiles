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

ifeq ($(shell uname),Darwin)
	FIND := gfind
else
	FIND := find
endif

.PHONY: dotfiles
dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml $(ANSIBLE_ARG)

.PHONY: dependencies
dependencies:
	# debug
	cp ./debug_zshrc ./.zshrc
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml $(ANSIBLE_ARG) $(ANSIBLE_SUDO_ARG)
	$(MAKE) zplug

.PHONY: zplug
zplug:
	zsh -lc "env"
	@zsh -lc "zplug list"
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

.PHONY: lint
lint:
	$(FIND) -type f -name "*.sh" -exec shellcheck {} \;
	ansible-lint ansible/dotfiles.yml
	ansible-lint ansible/dependencies.yml
	vint --color --style .vimrc

.PHONY: test
test:
	bash -n ~/.bashrc
	zsh -n ~/.zshrc
	zsh -lc "zplug check"
	peco --version
