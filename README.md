# Getting Started with Presto

## Introduction

This repository contains the files used to present the F8 2019 classroom demo:
*Getting Started with Presto: Run SQL at any Scale*. They will setup a Presto cluster
with MySQL and MongoDB instances that you can query from Presto.

## Requirements

- Docker (you can use [Docker CE](https://docs.docker.com/install/))
- Docker [Compose](https://docs.docker.com/compose/install/)

The demo was develop on Mac OS X.

## Quick Start

To start the Presto clusters and its dependencies:
```
docker-compose up
```

Then open the Jupyter Notebook:

```
open localhost:8888
```

The Jupyter Notebook password is `demo`. You can override it by changing the
SHA1 hash of `--NotebookApp.password='sha1:2017f6d8a65d:4f2115202d4cd8c081f1c135bc2b41292bcb4ec4'`
in `docker-compose.yml`.

The Presto UI is available at `localhost:8080`.

To run the Presto CLI:

```
docker exec -it f8-2019-demo_presto_1 bin/presto-cli
```

You can find Presto's documentation on [prestodb.io/docs/current/](http://prestodb.github.io/docs/current/).

## Next Steps

In this demo, we run all Presto nodes on the same machine. Presto has two types of nodes:
- The coordinator is the main server that compiles SQL And manages its execution
- The worker is a node that executes tasks scheduled by the coordinator

To run Presto in a distributed way, you will create a new instance with
`coordinator=false` in `etc/config.properties`.

- More about [deploying](http://prestodb.github.io/docs/current/installation/deployment.html) Presto
- Configuration properties [reference](http://prestodb.github.io/docs/current/admin/properties.html)
- [Developing](http://prestodb.github.io/docs/current/develop.html) extensions and integrations for Presto

## References

- https://prestodb.io
- https://github.com/prestodb/presto
- http://tinyurl.com/presto-paper
- https://prestodb.io/resources.html#libraries
- https://jupyter.org
