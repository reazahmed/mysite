FROM python:3

WORKDIR /app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY  . .

# default entry point in case no command is provi
# CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]

EXPOSE 8000
CMD [ "gunicorn", "--workers=2", "-b :8000", "mysite.wsgi" ]
