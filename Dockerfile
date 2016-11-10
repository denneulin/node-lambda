FROM 137112412989.dkr.ecr.eu-west-1.amazonaws.com/amazonlinux

RUN yum update \
    && yum -y groupinstall "Development Tools" \
    && yum -y install \
    git \
    wget \
    tar


#    yum install -y \
#    gcc44 \
#    gcc-c++ \
#    libgcc44 \
#    cmake

RUN mkdir /node
WORKDIR /node
RUN wget https://github.com/nodejs/node/archive/v4.3.2.tar.gz \
    && tar xvzf v4.3.2.tar.gz

WORKDIR /node/node-4.3.2
RUN ./configure \
    && make \
    && make install \
    && npm i -g npm

# now, node v4.3.2 and latest npm are installed
RUN node -v
RUN npm -v

CMD []
