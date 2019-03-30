# mydocker
# Tensorflow + NVidia GPU + Jupyter Notebook + Docker + Google Cloud

## Data Science docker container based on official tensorflow image. 
I use it to run on Google Cloud Instance.

Contains Tensorflow with GPU support and Jupyter Notebook.
All Addons listed in __requirements.txt__

### Instructions:

1) Install Nvidia cuda drivers on your linux machine https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
2) Verify that GPU is visible for CUDA drivers
```bash
~$ nvidia-smi
```
It will show table with available GPUs

3) install docker https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository
4) install Nvidia-docker https://github.com/NVIDIA/nvidia-docker
5) Test that GPU is visible from the docker
```bash
~$ sudo docker --runtime=nvidia --rm nvidia/cuda:9.0-base nvidia-smi 
```

You should see the same table as we saw at (2)

__Congrats! the environment is ready for work__

Now lets build and run docker image

### Creating Data science container. 
Copy my docker file and other files 
```bash 
~$ git clone https://github.com/MenshikovDmitry/mydocker/
```
Navigate to new directory, if needed, update __requirements.txt__ with your favourite text editor and build the image
```bash
~ $ cd mydocker/
~/mydocker $ sudo build .
```

Building will take some time. If it finished with no errors, Docker will provide you with unique name of image kinf of __35nkwjtuw8hfi2__.

__now we are ready to run__

1) Ensure that you have opened port 8888 in your firewall.
2) create a folder __~/notebooks/__ It  is going to be our shared folder with container.

3) Run container and assign a name __tf__ for it
```bash
~/docker/ $ sudo docker run --runtime=nvidia -p 8888:8888 -v ~/notebooks:/tf/notebooks --name tf <unique name of image>
```
4) If you are successfull, shell will report that jupyter notebook is running and it will provide you with a token. Copy it to clipboard
5) run browser http://<external_ip>:8888 to open a Jupyter notebook .

Use __Ctrl+C__ to stop container

In Future, to run and stop the container, use commands
```bash
~ $sudo docker start tf
~ $sudo docker stop tf
```


You also can open bash inside the running container 
```bash
~ $ sudo docker exec -it tf /bin/bash
```


Enjoy and don't forget to shutdown GPU instance after usage. It is costy to idle ;)
