#!/bin/bash
echo "Installing requirements..."
pip install -r requirements.txt

#!/bin/bash
echo "Running app from deploy.sh..."

source venv/bin/activate
nohup python3 app.py > app.log 2>&1 &
