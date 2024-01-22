# Makefile
SHELL = /bin/bash
POETRY = poetry run

# Styling
.PHONY: style
style:
	$(POETRY) black .
	$(POETRY) flake8
	$(POETRY) python3 -m isort .
	$(POETRY) pyupgrade

# Cleaning
.PHONY: clean
clean: style
	$(POETRY) python notebooks/clear_cell_nums.py
	find . -type f -name "*.DS_Store" -ls -delete
	find . | grep -E "(__pycache__|\.pyc|\.pyo)" | xargs rm -rf
	find . | grep -E ".pytest_cache" | xargs rm -rf
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf
	rm -rf .coverage*
