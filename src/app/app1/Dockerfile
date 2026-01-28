# Stage 1: Builder
FROM python:3.9-slim as builder

WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Stage 2: Runtime
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /install /usr/local
COPY . .

ENV PYTHONUNBUFFERED=1

RUN adduser --disabled-password --gecos "" appuser
USER appuser

# App1 listens on port 8080 (Cloud Run default)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]