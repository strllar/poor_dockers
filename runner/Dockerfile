FROM debian:jessie

MAINTAINER Cheng Kuan <lab@strllar.org>

EXPOSE 11625 11626 12625 12626 13625 13626

RUN apt-get update && apt-get install -y \
curl \
xz-utils \
unzip \
python \
awscli \
libpq5 \
&& apt-get clean \
&& mkdir oss && cd oss \
&& curl -O http://strllar.oss-cn-beijing.aliyuncs.com/downloads/OSS_Python_API_20150909.zip \
&& unzip OSS_Python_API_20150909.zip

ADD runcore.sh /

ENTRYPOINT ["/runcore.sh"]
CMD ["run", "master"]
