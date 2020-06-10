.ONESHELL:
SHELL := /bin/bash

setup:
	virtualenv robovenvx -p python3; \


install: setup
	( \
	source ./robovenvx/bin/activate; \
	pip install -r ./requirements-test.pip; \
	)

web: install
	source ./robovenvx/bin/activate;
	python mysite/manage.py runserver 9011

test: install
	python -m robot .
