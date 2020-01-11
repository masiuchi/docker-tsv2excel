FROM amazonlinux:2

COPY libxlsxwriter/ /libxlsxwriter/
WORKDIR /libxlsxwriter
RUN yum -y install make gcc zlib-devel
RUN make
RUN make install

COPY tsv2excel/ /tsv2excel/
WORKDIR /tsv2excel
RUN make
RUN mv tsv2excel /usr/local/bin/
ENV LD_LIBRARY_PATH /usr/local/lib:$LD_LIBRARY_PATH

