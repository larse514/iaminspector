#Build RepoKid
FROM python:2 AS build-repo

RUN git clone https://github.com/Netflix/repokid.git

WORKDIR repokid

RUN pip install bandit coveralls && \ 
    pip install . && \
    pip install -r test-requirements.txt && \
    python setup.py develop && \
    repokid config config.json

#Build proxy
FROM golang:alpine AS build-proxy
ADD . src/github.com/larse514/iaminspector/repokid/
WORKDIR src/github.com/larse514/iaminspector/repokid/repokidproxy/
RUN go get net/http
RUN go get encoding/json
RUN apk add --update make

RUN make

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-proxy /go/src/github.com/larse514/iaminspector/repokid/repokidproxy/repokidproxy /app
COPY --from=build-repo /repokid/repokid /app
COPY --from=build-repo /repokid/config.json /app

ADD bin/run.sh /app

RUN chmod +x run.sh
ENTRYPOINT [ "./run.sh" ]