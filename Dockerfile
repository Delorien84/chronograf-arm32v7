FROM resin/armv7hf-debian
ARG version=1.3.6.0

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install wget && \
	wget wget https://dl.influxdata.com/chronograf/releases/chronograf-${version}_linux_armhf.tar.gz && \
	tar xvfz chronograf-${version}_linux_armhf.tar.gz --strip-components=1 -C / && \
	rm chronograf-${version}_linux_armhf.tar.gz && \
	apt-get clean all && \
    	rm -r /var/lib/apt/lists/*

RUN [ "cross-build-end" ]  

EXPOSE 8888
ENTRYPOINT ["/usr/bin/chronograf"]

