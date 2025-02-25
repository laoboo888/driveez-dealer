#!/bin/bash

# Ensure pip is installed
python3.9 -m ensurepip --default-pip
python3.9 -m pip install --upgrade pip

# Install dependencies
echo "Installing dependencies..."
python3.9 -m pip install -r requirements.txt

# Navigate to the Django project directory
cd CarDealerWeb

# Check if manage.py exists
if [ ! -f "manage.py" ]; then
  echo "Error: manage.py not found!"
  exit 1
fi

echo "Make Migration..."
python3.9 manage.py makemigrations --noinput
python3.9 manage.py migrate --noinput

echo "Collect Static..."
python3.9 manage.py collectstatic --noinput --clear

# Return to the root directory
cd ..
