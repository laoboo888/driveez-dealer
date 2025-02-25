#!/bin/bash

# Ensure pip is installed
python3.9 -m ensurepip --default-pip
python3.9 -m pip install --upgrade pip
python3.9 -m pip install --upgrade pip setuptools wheel

# Navigate to the Django project directory
cd CarDealerWeb

echo "Installing dependencies line by line..."

# Install each dependency separately
python3.9 -m pip uninstall django-ckeditor
python3.9 -m pip install django-ckeditor-5
python3.9 -m pip install asgiref
python3.9 -m pip install certifi
python3.9 -m pip install chardet
python3.9 -m pip install defusedxml
python3.9 -m pip install dj-database-url
python3.9 -m pip install Django
python3.9 -m pip install django-allauth
python3.9 -m pip install django-ckeditor
python3.9 -m pip install django-js-asset
python3.9 -m pip install django-multiselectfield
python3.9 -m pip install gunicorn
python3.9 -m pip install idna
python3.9 -m pip install oauthlib
python3.9 -m pip install Pillow
python3.9 -m pip install psycopg2-binary
python3.9 -m pip install python3-openid
python3.9 -m pip install pytz
python3.9 -m pip install requests
python3.9 -m pip install requests-oauthlib
python3.9 -m pip install sqlparse
python3.9 -m pip install urllib3
python3.9 -m pip install whitenoise

echo "All dependencies installed."

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
