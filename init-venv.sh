rm -rf venv
python -m venv venv
venv/scripts/python.exe -m pip install --upgrade pip
venv/scripts/pip install -r requirements.txt -r requirements-dev.txt

# if using an IPython kernel
# #venv/scripts/ipython kernel install --user --name=my-project
# some environments would use IPython kernel install --user --name=my-project
