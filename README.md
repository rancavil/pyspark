# PySpark Jupyterlab docker environment

## Creating a Spark Image

First of all, we'll create an image from scratch. We are going to use Spark 3.2.0.

     $ git clone -b pyspark-jupyterlab https://github.com/rancavil/pyspark.git
     $ cd pyspark
     $ docker build -t pyspark-jupyterlab .

With the previous commands, we have created an image called pyspark.

## Creating our container with the Pyspark environment

We'll create a container with the following command.

     $ docker run -d --name <your_container_name> -p 8000:8000 pyspark-jupyterlab

## Pyspark and Jupyterlab

In your browser go to:

     http://localhost:8000

## Stopping and restarting the Pyspark environment

To stop the container you just execute the following command.

     $ docker stop <your_container_name>

And, to restart you just execute.

     $ docker start <your_container_name>
