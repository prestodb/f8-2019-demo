# Copyright (c) Facebook, Inc. and its affiliates.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM jupyter/scipy-notebook:latest
USER root
RUN apt-get update -y && apt-get install -qy graphviz libmysqlclient-dev mongodb-clients mysql-client wget host
RUN pip install presto-python-client pyhive graphviz mysql-client mysql-connector-python mongo
COPY f8_demo.ipynb /home/jovyan/
COPY Testing-Presto-SQL.ipynb /home/jovyan/
