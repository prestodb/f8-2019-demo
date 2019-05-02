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

FROM openjdk:8-jre
EXPOSE 8080

MAINTAINER Greg Leclercq "ggreg@fb.com"
ARG PRESTO_VERSION=0.218
ENV PRESTO_PKG presto-server-$PRESTO_VERSION.tar.gz
ENV PRESTO_PKG_URL https://repo1.maven.org/maven2/com/facebook/presto/presto-server/$PRESTO_VERSION/$PRESTO_PKG

ENV PRESTO_CLI_JAR_URL https://repo1.maven.org/maven2/com/facebook/presto/presto-cli/$PRESTO_VERSION/presto-cli-$PRESTO_VERSION-executable.jar


# Install python to run the launcher script
RUN apt-get update
RUN apt-get install -y python less

# Download Presto package
# Use curl rather ADD <remote> to leverage RUN caching
# Let curl show progress bar to prevent Travis from thinking the job is stalled
RUN curl -o /$PRESTO_PKG $PRESTO_PKG_URL
RUN tar -zxf /$PRESTO_PKG

# Create directory for Presto data
RUN mkdir -p /var/lib/presto/data

# Add Presto configuration
WORKDIR /presto-server-$PRESTO_VERSION
RUN mkdir etc
ADD etc/jvm.config etc/
ADD etc/config.properties etc/
ADD etc/node.properties etc/
ADD etc/catalog etc/catalog

# Download Presto CLI
RUN mkdir -p bin
RUN curl -o bin/presto-cli $PRESTO_CLI_JAR_URL
RUN chmod +x bin/presto-cli

CMD bin/launcher.py run
