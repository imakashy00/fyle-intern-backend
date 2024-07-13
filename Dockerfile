FROM python:3.8.10-bullseye

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=core/server.py

RUN flask db upgrade -d core/migrations/

CMD ["bash", "run.sh"]