# Ansible apt module doesn't work if you use pyenv, asdf, etc.
# Therefore, you need to specify the system installed python path.
OS := $(shell uname)
ifeq ($(OS),Linux)
	ANSIBLE_ARG := -e ansible_python_interpreter=/usr/bin/python3
else
	# Darwin
	ANSIBLE_ARG :=
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

.PHONY: check-dotfiles
check-dotfiles:
	@cd ansible; \
	ansible-playbook -i localhost, dotfiles.yml --check $(ANSIBLE_ARG)

.PHONY: dependencies
dependencies:
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml -vvv $(ANSIBLE_ARG) $(ANSIBLE_SUDO_ARG)

.PHONY: check-dependencies
check-dependencies:
	@cd ansible; \
	ansible-playbook -i localhost, dependencies.yml --check $(ANSIBLE_ARG) $(ANSIBLE_SUDO_ARG)

.PHONY: lint
lint:
	ansible-lint ansible/dotfiles.yml
	ansible-lint ansible/dependencies.yml
	vint --color --style .vimrc

.PHONY: test
test:
	bash -n ~/.bashrc
	zsh -n ~/.zshrc
	peco --version
