FROM python:3.11-slim

WORKDIR /app

# Install system dependencies for pyswisseph
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy Astrologer folder
COPY Astrologer/ /app/Astrologer/

# Copy root files
COPY requirements.txt* /app/

WORKDIR /app/Astrologer

# Install dependencies
RUN pip install --no-cache-dir -e .

EXPOSE 8080

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
