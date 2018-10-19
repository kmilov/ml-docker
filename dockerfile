FROM ubuntu:xenial

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    wget \
    vim \
    python-dev \
    nano


RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	rm get-pip.py

RUN apt-get update && apt-get install -y \
		graphviz \
		&& \
	apt-get clean && \
	apt-get autoremove && \
	rm -rf /var/lib/apt/lists/*

# Install other useful Python packages using pip
RUN pip --no-cache-dir install --upgrade ipython
RUN pip --no-cache-dir install --upgrade \
		Cython \
		ipykernel \
		jupyter \
		path.py \
		Pillow \
		pygments \
		six \
		sphinx \
		wheel \
		zmq \
    numpy \
    scipy \
    nose \
    sympy \
    pydotplus \
    matplotlib \
    pandas \
    scikit-image \
    sklearn \
		&& \
	python -m ipykernel.kernelspec

EXPOSE 8888

COPY jupyter_notebook_config.py /root/.jupyter/

COPY run_jupyter.sh /root/

ADD . /root/shared

WORKDIR "/root"

CMD ["/bin/bash"]
