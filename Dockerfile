#using official tensorflow image
FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

RUN pip install --upgrade pip

#install all necessary libraries such as pandas, PIL etc..
ADD requirements.txt .
RUN mkdir ./notebooks
RUN pip install -r requirements.txt

#open Jupter notebook port
EXPOSE 8888

#allow for all IP range
CMD jupyter notebook --allow-root --no-browser --port 8888 --ip 0.0.0.0

