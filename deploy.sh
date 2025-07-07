#!/bin/bash
echo "Installing requirements..."
pip install -r requirements.txt

echo "Running Flask app..."
nohup python3 app.py > app.log 2>&1 &
