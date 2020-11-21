FROM ubuntu:18.04

RUN apt-get update -y && apt-get install vim -y && apt-get install wget -y && apt-get install ssh -y && apt-get install openjdk-8-jdk -y && apt-get install sudo -y

RUN useradd -m spark && echo "spark:spark" | chpasswd && adduser spark sudo && echo "spark     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 

WORKDIR /home/spark

USER spark
RUN wget -q https://downloads.apache.org/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz && tar zxvf spark-3.0.1-bin-hadoop3.2.tgz && rm spark-3.0.1-bin-hadoop3.2.tgz

ENV SPARK_HOME /home/spark/spark-3.0.1-bin-hadoop3.2

ENV PATH $PATH:$SPARK_HOME/bin:$SPARK_HOME/sbin

RUN cd /usr/bin/ && sudo ln -s python3 python
RUN sudo apt-get install net-tools iproute2 -y
RUN sudo apt-get install python3-distutils -y && wget https://bootstrap.pypa.io/get-pip.py && sudo python3 get-pip.py && python -m pip install pandas
RUN python -m pip install matplotlib && sudo apt-get install python3-tk -y

COPY docker-entrypoint.sh $SPARK_HOME/sbin

EXPOSE 8080 8081 7077 6066 4040 18080 22 

ENTRYPOINT ["/home/spark/spark-3.0.0-bin-hadoop3.2/sbin/docker-entrypoint.sh"]

