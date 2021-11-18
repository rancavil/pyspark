# PySpark docker environment

## Creating a Spark Image

First of all, we'll create an image from scratch. We are going to use Spark 3.2.0.

     $ git clone https://github.com/rancavil/pyspark.git
     $ cd pyspark
     $ docker build -t pyspark .

With the previous commands, we have created an image called pyspark.

## Creating our container with the Pyspark environment

We'll create a container with the following command.

     $ docker run -it --name <your_name> -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw pyspark

## Creating a little example

To test our environment we'll create a simple example using pandas and matplotlib. In the example, we create a DataFrame with four cities and their population.

     >>> import pandas as pd
     >>> import matplotlib.pyplot as plt
     >>> data = {'city' : ['Santiago','New York','Buenos Aires','Berlin'], 'population': [5.614,19.45,2.89,3.769]}
     >>> df = pd.DataFrame(data,columns=['city','population'])
     >>> df
                city  population
     0      Santiago       5.614
     1      New York      19.450
     2  Buenos Aires       2.890
     3        Berlin       3.769
     >>> plt.plot(df.city,df.population)
     [<matplotlib.lines.Line2D object at 0x7f7f974cfc50>]
     >>> plt.xlabel('Cities')
     Text(0.5, 0, 'Cities')
     >>> plt.ylabel('Population (million)')
     Text(0, 0.5, 'Population (million)')
     >>> plt.show()

## Stopping and restarting the Pyspark environment

To stop the container you just execute the following command.

     >>> exit()

And, to restart you just execute.

     $ docker start -i <your_name>
