# Use official Python 3.10 image
FROM python:3.10.13-slim-bookworm

# Set working directory
WORKDIR /app

# Install system dependencies first
RUN apt-get update && \
    apt-get install -y \
    graphviz \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for caching
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files
COPY . .

# Expose Streamlit's default port
EXPOSE 8501

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8501/_stcore/health

# Run Streamlit
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]