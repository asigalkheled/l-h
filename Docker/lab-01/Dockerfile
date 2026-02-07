FROM python:3.10-slim

# Prevent Python from writing .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies first (Faster rebuilds:

#If app.py changes → pip layer is reused

#Docker layer caching works correctly)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy only what we need
COPY app.py .
COPY templates ./templates

EXPOSE 5000
CMD ["python3", "app.py"]