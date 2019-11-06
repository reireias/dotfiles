.PHONY: dotfiles
dotfiles:
	bash ./deploy.sh

.PHONY: dependencies
dependencies:
	bash initialize.sh

.PHONY: test
test:
	bash test.sh
