#using official tensorflow image
FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

RUN pip install --upgrade pip

RUN apt-get update && apt-get install -y \
	 python-opencv \
	cython
RUN pip install jupyterlab

#install all necessary libraries such as pandas, PIL etc..
ADD requirements.txt .
RUN mkdir ./notebooks
RUN pip install -r requirements.txt

#open Jupter notebook port
EXPOSE 8888

#allow for all IP range
CMD jupyter lab --allow-root --no-browser --port 8888 --ip 0.0.0.0 --NotebookApp.token=''
