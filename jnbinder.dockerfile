FROM gaow/base-notebook:1.0.0

LABEL maintainer="Gao Wang <wang.gao@columbia.edu>"
   
USER root
RUN pip install bs4 date_parser 
ADD release /usr/local/bin/jnbinder
USER jovyan
CMD ['/usr/local/bin/jnbinder']
