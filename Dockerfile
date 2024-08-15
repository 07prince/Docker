#FROM continuumio/anaconda3
#COPY rf.pkl /usr/app/
#COPY . /usr/app/
#EXPOSE 8000
#WORKDIR /usr/app/
#RUN pip install scikit-learn==1.4.1.post1
#RUN pip install -r requirements.txt
#CMD python flask_api.py
#FROM continuumio/anaconda3

# Copy requirements.txt first for better layer caching
#COPY requirements.txt /usr/app/
#WORKDIR /usr/app/

# Install dependencies
#RUN pip install scikit-learn==1.4.1.post1
#RUN pip install -r requirements.txt

# Copy the rest of the application code
#COPY . /usr/app/

# Expose the port that the Flask app will run on
#EXPOSE 5000

# Run the Flask API
#CMD python flask_api.py


# Use a lighter base image
FROM python:3.12-slim

# Set the working directory
WORKDIR /usr/app/

# Copy only requirements.txt first for better caching
COPY requirements.txt /usr/app/

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . /usr/app/

# Expose the port that the Flask app will run on
EXPOSE 5000

# Run the Flask API using app.py
CMD ["python", "app.py"]
