FROM ubuntu:22.04

RUN apt-get update

# Step 1. Build and install DOSBox.

RUN apt-get install -y automake
RUN apt-get install -y g++
RUN apt-get install -y libsdl1.2-dev
RUN apt-get install -y make

WORKDIR /dosbox
COPY dosbox .

RUN ./autogen.sh
RUN ./configure
RUN make install

WORKDIR /
RUN rm -rf /dosbox

# Step 2. Install library.

RUN apt-get install -y python3
RUN apt-get install -y python3-pip

WORKDIR /library
COPY README.md .
COPY requirements.txt .
COPY setup.py .
COPY testbox testbox

RUN pip3 install .
