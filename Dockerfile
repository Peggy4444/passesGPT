FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Install system tools and compilers
RUN apt-get update && \
    apt-get install -y gcc python3-dev g++ && \
    rm -rf /var/lib/apt/lists/*

# Copy requirements first to take advantage of Docker cache
COPY requirements.txt .
COPY xgboost_req.sh .

# Upgrade pip and install Python dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Make sure the script is executable and run it
RUN chmod +x xgboost_req.sh && \
    ./xgboost_req.sh

# Copy the rest of the app's code
COPY . .

# Expose the Streamlit default port
EXPOSE 8501

# Command to run the app
CMD ["streamlit", "run", "app.py"]
