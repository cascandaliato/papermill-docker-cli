FROM ubuntu

LABEL maintainer="Carmelo Scandaliato <carmelo.scandaliato@gmail.com>"
LABEL source=https://github.com/casca/papermill-docker-cli

RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    python3 -m pip --no-cache-dir install notebook papermill papermill[all] \
                                          numpy matplotlib pandas seaborn scipy

RUN mkdir /notebooks

ADD entrypoint.sh /

RUN chmod a+x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["--help"]
