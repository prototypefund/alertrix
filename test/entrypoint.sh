#!/bin/bash
# these libs should be included by mounting their development folders as volume, so we do not need them from pypi
pip uninstall alertrix -y
pip uninstall djangomatrixappservice -y
python manage.py migrate --noinput
# Start the web service
python -m uvicorn --host 0.0.0.0 --port 8000 alertrix_deployment.asgi:application &
python -m coverage run manage.py test_alertrix
python -m coverage report
