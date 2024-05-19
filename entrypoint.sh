#!/bin/bash
python -m uvicorn --host 0.0.0.0 --port 8000 alertrix_deployment.asgi:application
