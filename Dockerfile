FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*

# Copy everything
COPY . .

# Install Python dependencies
RUN cd Astrologer && pip install --no-cache-dir -e .

EXPOSE 8080

# Start the app
CMD ["bash", "start.sh"]
