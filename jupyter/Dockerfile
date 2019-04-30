FROM jupyter/scipy-notebook:latest
USER root
RUN apt-get update -y && apt-get install -qy graphviz libmysqlclient-dev mongodb-clients mysql-client wget host
RUN pip install presto-python-client pyhive graphviz mysqlclient mongo
COPY f8_demo.ipynb /home/jovyan/
