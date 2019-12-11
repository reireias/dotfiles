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
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml $(ANSIBLE_ARG) $(ANSIBLE_SUDO_ARG)
	@# NOTE: ignore pipe error setting in GitHub Actions
	@zsh -l bin/zplug.zsh < /dev/null

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
	# NOTE: ignore pipe error setting in GitHub Actions
	zsh -lc "zplug check" < /dev/null
	peco --version
