FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive


RUN apt update -y
RUN apt install python3 mc htop pip curl wget -y
RUN apt install software-properties-common -y 

RUN pip install jupyterlab
RUN useradd --user-group --system --create-home --no-log-init app

RUN mkdir /work

USER app

RUN pip install scipy numpy matplotlib pandas sympy

WORKDIR /home/app
COPY jupyter /home/app/.jupyter

EXPOSE 8888

ENTRYPOINT [ "jupyter","notebook", "--ip", "0.0.0.0", "--port", "8888", "--no-browser"]
