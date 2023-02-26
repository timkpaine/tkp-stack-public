setup:  ## install required dependencies
	pip install ansible ansible-lint

lint: check-deps  ## run linter with ansible-lint
	ansible-lint -p playbooks/* roles/

check-deps:  ## check that we haven't emptied dependencies for testing
	bash -c 'grep -rn "dependencies: \[\]" ./roles/'
	bash -c '[[ "$$(grep -rn "dependencies: \[\]" ./roles/ | wc -l | tee >(cat 1>&2))" == "2" ]]'

# Thanks to Francoise at marmelab.com for this
.DEFAULT_GOAL := help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

print-%:
	@echo '$*=$($*)'

.PHONY: help setup lint check-deps
