help:
	@echo "Available Targets:"
	@cat Makefile | egrep '^(\w+?):' | sed 's/:\(.*\)//g' | sed 's/^/- /g'

test:
	@python -m pytest

release:
	@python setup.py sdist bdist_wheel
	@twine upload dist/*

lint:
	@black .
	@isort .
	@flake8 .
	@pydocstyle .
	@mypy model_bakery

.PHONY: test release
