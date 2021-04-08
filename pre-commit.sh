set -e

echo "Running install check"
rm -rf pre-commit-venv
python -m venv pre-commit-venv
pre-commit-venv/scripts/python.exe -m pip install --upgrade pip
pre-commit-venv/scripts/pip install .

echo "Running formatting, linting, tests"
pre-commit-venv/scripts/pip install -r requirements.txt -r requirements-dev.txt
pre-commit-venv/scripts/python.exe -m black package tests setup.py
pre-commit-venv/scripts/python.exe -m flake8 package tests setup.py
pre-commit-venv/scripts/python.exe -m pytest

echo "Removing pre-commit venv"
rm -rf pre-commit-venv

echo "Updating docs"
if ! [ -d docs ]; then mkdir docs; fi

# TODO: not working
echo "pydoc-markdown not working in .sh"
echo "Run -> pydoc-markdown -I package --render-toc > docs/README.md"
venv/scripts/python.exe -m pydoc-markdown -I package --render-toc > docs/README.md
