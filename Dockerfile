#FROM continuumio/anaconda3
#COPY rf.pkl /usr/app/
#COPY . /usr/app/
#EXPOSE 8000
#WORKDIR /usr/app/
#RUN pip install scikit-learn==1.4.1.post1
#RUN pip install -r requirements.txt
#CMD python flask_api.py
FROM continuumio/anaconda3

# Copy requirements.txt first for better layer caching
COPY requirements.txt /usr/app/
WORKDIR /usr/app/

# Install dependencies
RUN pip install scikit-learn==1.4.1.post1
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY . /usr/app/

# Expose the port that the Flask app will run on
EXPOSE 5000

# Run the Flask API
CMD python flask_api.py
