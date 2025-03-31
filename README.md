# Applications Deployment Repository

This repository contains deployment scripts and configurations for Flask-based applications in our infrastructure.

## Overview

This repository manages the deployment of two main types of applications:
- Standard Flask Applications
- Inference Applications (ML model serving)

Both application types are hosted on NFS servers and use Python virtual environments with Gunicorn for production serving.

## Application Types

### Standard Flask App

A standard web application built with Flask framework that serves web content on port 5000.

### Inference App

A Flask-based application specifically designed for machine learning model inference, packaged as a zip file and served on port 5000.

## Deployment Scripts

The repository contains two main deployment scripts:

### 1. `deploy_flask_app.sh`

Deploys a standard Flask application.

```bash
./deploy_flask_app.sh
```

### 2. `deploy_inference_app.sh`

Deploys an inference application.

```bash
./deploy_inference_app.sh
```

## Deployment Process

Both application types follow a similar deployment process:

1. Repository configuration in `apps.json`
2. Repository update on NFS server
3. Application files copying/extraction
4. Python virtual environment setup
5. Dependencies installation
6. Application launch with Gunicorn

## Prerequisites

- Python 3
- Access to NFS server
- Proper entry in `apps.json` file
- Required configuration files in `/home/vboxuser/configuration/`

## Directory Structure

```
repository/
├── apps.json              # Application configuration entries
├── deploy_flask_app.sh    # Script to deploy standard Flask apps
├── deploy_inference_app.sh # Script to deploy inference apps
└── [application directories]
```

## Configuration

Before deploying any application, add appropriate entries to the `apps.json` file with necessary configuration parameters.

## Deployment Steps

### Standard Flask App

1. Add entry to `apps.json`
2. Run `./deploy_flask_app.sh`

### Inference App

1. Add entry to `apps.json`
2. Run `./deploy_inference_app.sh`

## Accessing Applications

Once deployed, applications are accessible at:
```
http://[server-address]:5000
```

## Maintenance

Regular updates to the applications can be performed by running the deployment scripts again, which will update the files and restart the services.