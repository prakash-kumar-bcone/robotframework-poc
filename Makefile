SHELL := /bin/bash

setup:
	virtualenv robovenvv -p python3; \

install: setup
	( \
	source ./robovenvv/bin/activate; \
	pip install -r ./requirements-test.pip; \
	)

robot-test: install
	python -m robot .
