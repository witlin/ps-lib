sudo docker run -it -p 8888:8888 --name jupyter --volume ~/jupyter-notebooks:/opt/notebooks continuumio/anaconda3:latest /bin/bash -c "\
conda install jupyter && \
conda install numpy && \
conda install pandas && \
conda install scipy && \
conda install matplotlib \
mkdir -p /opt/notebooks && \
jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser --allow-root"