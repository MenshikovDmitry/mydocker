FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

RUN pip install --upgrade pip

ADD requirements.txt .
RUN mkdir ./notebooks
RUN pip install -r requirements.txt

EXPOSE 8888
CMD jupyter notebook --allow-root --no-browser --port 8888 --ip 0.0.0.0

