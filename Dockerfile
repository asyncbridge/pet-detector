FROM nvidia/cuda:10.2-cudnn8-devel-ubuntu18.04
#FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python3-dev python3-pip python3-tk wget curl git vim libsm6 libxext6 libxrender-dev screen libopencv-dev
RUN ln -sf /usr/bin/python3 /usr/bin/python && python -V && which python
RUN ln -sf /usr/bin/pip3 /usr/bin/pip && pip -V && which pip
RUN pip3 install --upgrade pip setuptools
RUN pip3 install -U pip six numpy wheel setuptools mock future>=0.17.1 opencv-python matplotlib pillow scikit-image redis tzlocal

RUN mkdir /workspace
RUN mkdir /workspace/darknet
RUN mkdir /workspace/darknet/weights
ADD ./source/darknet /workspace/darknet
WORKDIR /workspace/darknet
RUN curl -o ./weights/yolov4.weights -LJO https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights
RUN make
ADD ./source/app.py /workspace/darknet
ADD ./entrypoint.sh /workspace/darknet
ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
