FROM alpine

RUN apk --update add git curl bind-tools net-tools wget openssh

RUN echo "while true; do echo sleeping..; sleep 86400; done" > /usr/local/bin/sleeper && \
      chmod +x /usr/local/bin/sleeper

ARG vegeta_version=12.2.0

RUN curl -fsSL -o vegeta.tar.gz "https://github.com/tsenart/vegeta/releases/download/cli%2Fv${vegeta_version}/vegeta-${vegeta_version}-linux-amd64.tar.gz" && \
      tar -zxvf vegeta.tar.gz && \
      mv vegeta /usr/local/bin/vegeta && \
      chmod +x /usr/local/bin/vegeta && \
      rm -f vegeta.tar.gz

CMD ["sh", "/usr/local/bin/sleeper"]

