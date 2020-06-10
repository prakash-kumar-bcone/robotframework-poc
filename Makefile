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
	django-admin.py startproject mysite
	python mysite/manage.py migrate
	python mysite/manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('demo', 'demo@example.com', 'PassPass1')"
	python mysite/manage.py runserver 9011

robot-test: install
	python -m robot .
