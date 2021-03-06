FROM gaow/base-notebook:1.0.0

LABEL maintainer="Gao Wang <wang.gao@columbia.edu>"
   
USER root
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9 && \
    apt-get update && apt-get install -y -qq linkchecker git
RUN pip install bs4 date_parser jupyter_contrib_nbextensions ipyrmd sos==0.21.8 
COPY release /usr/local/bin/jnbinder

USER jovyan

# docker build -t gaow/jnbinder -f jnbinder.dockerfile .
