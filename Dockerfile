# Pin to Python 3.10.11 â€” pyrogram 2.0.106 is NOT compatible with Python 3.12+
FROM python:3.10.11-slim

# Install system dependencies with retry-friendly flags
RUN apt-get update --fix-missing && \
    apt-get install -y --fix-missing --no-install-recommends \
        build-essential \
        ffmpeg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python3", "main.py"]
