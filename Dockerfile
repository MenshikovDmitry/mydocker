FROM tensorflow/tensorflow:latest-gpu

ARG TORCH_VERSION=1.7.0
ARG TORCHVISION_VERSION=0.8.1
ARG TORCHAUDIO_VERSION=0.7.0
ARG TORCH_CUDA_VERSION=cu101

ARG TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone
RUN apt-get update && apt-get install -y \
	python-opencv

RUN python3 -m pip install --no-cache-dir \
    jupyterlab \
    torch==${TORCH_VERSION}+${TORCH_CUDA_VERSION} \
    torchvision==${TORCHVISION_VERSION}+${TORCH_CUDA_VERSION} \
    torchaudio===${TORCHAUDIO_VERSION} \
    -f https://download.pytorch.org/whl/torch_stable.html \
    opencv-python \
    Cython \
    pandas \
    scipy \
    sklearn \
    Pillow \
    nbimporter \
    matplotlib \
    --upgrade pip

EXPOSE 8888

CMD jupyter-lab --allow-root --no-browser --port 8888 --ip 0.0.0.0 --NotebookApp.token=''
