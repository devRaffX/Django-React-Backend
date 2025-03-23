#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

if [ "$CREATE_SUPERUSER" = "true" ]; then
    sleep 5
    python manage.py createsuperuser --no-input
fi
