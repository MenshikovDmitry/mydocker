#FROM jupyter/datascience-notebook
FROM jupyter/minimal-notebook
#FROM nbgallery/jupyter-alpine
#RUN apt-get update
#RUN apt-get -y install python3-pip

RUN pip install --upgrade pip
#RUN apk add python3-dev
#RUN pip install pyzmq

#RUN pip install jupyter

ADD requirements.txt .
RUN pip install -r requirements.txt
COPY gitclone.sh /gitclone.sh

EXPOSE 8888
#CMD ["/gitclone.sh"] 
CMD jupyter notebook --no-browser --port 8888 --ip 0.0.0.0

