FROM dliu/ubuntu-miniconda:16.04
#FROM dliu/ubuntu-gnome-miniconda:16.04
MAINTAINER David Liu <email4dliu@gmail.com>

RUN apt-get install -y libxrender1 locales fonts-arphic-uming
RUN locale-gen "en_US.UTF-8"
RUN update-locale "en_US.UTF-8"

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8

RUN conda install pymongo pyqt=4 psutil websocket
RUN conda install --channel https://conda.anaconda.org/auto qdarkstyle

ADD . /vnpy

RUN cd /vnpy/vn.ctp && bash ./build.sh
RUN cd /vnpy/vn.ib && bash ./build.sh
RUN cd /vnpy/vn.lts && bash ./build.sh

WORKDIR /vnpy

CMD [ "python", "/vnpy/vn.trader/vtMain.py" ]


