FROM python:3.12-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

## Install system dependencies
#RUN apt-get update \
#    && apt-get install -y --no-install-recommends \
#        build-essential \
#        libpq-dev \
#    && rm -rf /var/lib/apt/lists/*

# Set working directory in the container
WORKDIR /app

# Copy Pipfile and Pipfile.lock to the working directory
COPY Pipfile Pipfile.lock /app/

# Install dependencies
RUN pip install pipenv
RUN pipenv install --system --deploy --ignore-pipfile

# Copy the rest of the application code
COPY src/ /app/

EXPOSE 8080
ENV SERVER_PORT=8080

# Command to run the application
CMD ["python", "server.py"]