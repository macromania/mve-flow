SHELL := /bin/bash

.PHONY: help
.DEFAULT_GOAL := help
.ONESHELL: # Applies to every target in the file https://www.gnu.org/software/make/manual/html_node/One-Shell.html
MAKEFLAGS += --silent # https://www.gnu.org/software/make/manual/html_node/Silent.html

help: ## 💬 This help message :)
	grep -E '[a-zA-Z_-]+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-23s\033[0m %s\n\n", $$1, $$2}'

setup-local-env: ## 🐍 Create a virtual environment and install dependencies
	@echo "🐍 Creating a virtual environment..."
	python -m venv .venv

	@echo "🐍 Virtual environment created. Running 'source .venv/bin/activate' to activate it."

	@echo "🐍 Installing dependencies..."
	. .venv/bin/activate; pip install -r requirements.txt

	@echo "🐍 Setting up notebooks filtering"
	nbstripout --install --attributes .gitattributes