FROM ubuntu:16.04

FROM python

#RUN apt-get update -y && \
    #apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

COPY . /app

#RUN pip install --upgrade pip

RUN pip install -r requirements.txt

CMD python /app/model.py &&  streamlit run /app/server.py

 
