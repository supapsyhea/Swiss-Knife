FROM python:3.9-slim-buster

WORKDIR /app

COPY . /app

RUN python -m venv /app/venv

ENV PATH="/app/venv/bin:$PATH"
RUN . venv/bin/activate && \
    pip install --no-cache-dir --upgrade pip \   
    pip install --no-cache-dir -r requirements.txt 

RUN apt-get update && apt-get install -y tzdata
ENV TZ="Europe/Kiev"

CMD ["python", "main.py"]
