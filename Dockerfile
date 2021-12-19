FROM python:3.8-slim-buster

RUN apt-get update && apt-get install -y git python3-dev gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN /usr/local/bin/python -m pip install --upgrade pip

RUN pip install --upgrade -r requirements.txt

COPY app app/

RUN python app/server.py

EXPOSE 5000

CMD ["python", "app/server.py", "serve"]
