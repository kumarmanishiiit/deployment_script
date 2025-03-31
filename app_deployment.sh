#!/bin/bash

# Flask App Deployment Script

# Exit on error
set -e

echo "Starting Flask App Deployment Process..."

# Repository Setup
echo "Setting up repository..."
# Note: You need to manually add the entry in apps.json first
sudo /usr/local/bin/update_repo.sh

# Application Setup
echo "Setting up application..."
cp -r /home/vboxuser/configuration/app_server .
cd app_server

# Environment Setup
echo "Creating and activating virtual environment..."
python3 -m venv ~/env
source ~/env/bin/activate

# Install Dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Launch Application
echo "Starting Flask application with Gunicorn..."
gunicorn --bind 0.0.0.0:5000 wsgi:app

echo "Deployment complete!"