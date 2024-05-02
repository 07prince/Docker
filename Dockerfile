FROM continuumio/anaconda3
COPY rf.pkl /usr/app/
COPY . /usr/app/
EXPOSE 8000
WORKDIR /usr/app/
RUN pip install scikit-learn==1.4.1.post1
RUN pip install -r requirements.txt
CMD python flask_api.py