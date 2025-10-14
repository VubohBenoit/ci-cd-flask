.PHONY: test unit regression lint build docker-test coverage

install-dev:
	python -m pip install --upgrade pip
	pip install -r requirements-dev.txt

unit:
	pytest tests/unit -q

regression:
	pytest tests/regression -q

lint:
	flake8 . --max-line-length=120

build:
	docker build -t ci-cd-flask:latest .

docker-test: build
	docker run -d --name cicd_test -p 5000:5000 ci-cd-flask:latest
	sleep 2
	pytest tests/regression -q
	docker stop cicd_test && docker rm cicd_test

coverage:
	pytest --cov=app --cov-report=xml
