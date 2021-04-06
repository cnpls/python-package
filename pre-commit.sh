echo "running install check"
rm -rf pre-commit-venv
python -m venv pre-commit-venv
pre-commit-venv/scripts/python.exe -m pip install --upgrade pip
pre-commit-venv/scripts/python.exe -m pip install .

echo "running formatting, linting, tests"
pre-commit-venv/scripts/python.exe -m pip install -r requirements-dev.txt
pre-commit-venv/scripts/python.exe -m black package tests setup.py
pre-commit-venv/scripts/python.exe -m flake8 package tests setup.py
pre-commit-venv/scripts/python.exe -m pytest

echo "removing pre-commit venv"
rm -rf pre-commit-venv

echo "updating docs"
mkdir docs

# TODO: not working
echo "pydoc-markdown not working in .sh"
echo "Run -> venv/scripts/python.exe -m pydoc-markdown -I package --render-toc > docs/README.md"
venv/scripts/python.exe -m pydoc-markdown -I package --render-toc > docs/README.md
