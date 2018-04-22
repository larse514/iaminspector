#Possibly break up dockerized aardvark into a base aardvark dockerfile,
#aardvark-collector dockerfile, aardvark apiserver dockerfile.
FROM python:2

RUN git clone https://github.com/Netflix-Skunkworks/aardvark.git && \
    cd aardvark && \ 
    python setup.py develop

WORKDIR aardvark
#install phantomjs
RUN apt-get update && \
apt-get install -y build-essential chrpath libssl-dev libxft-dev && \
apt-get install -y libfreetype6 libfreetype6-dev && \
apt-get install -y libfontconfig1 libfontconfig1-dev && \
apt-get install -y wget && \
cd ~  && \
export PHANTOM_JS="phantomjs-2.1.1-linux-x86_64" && \
wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 && \
mv $PHANTOM_JS.tar.bz2 /usr/local/share/ && \
cd /usr/local/share/ && \
tar xvjf $PHANTOM_JS.tar.bz2 && \
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/share/phantomjs && \
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin/phantomjs && \
ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/bin/phantomjs && \
phantomjs --version

ADD bin/run.sh /app/
WORKDIR /app
RUN chmod +x run.sh
ENTRYPOINT [ "./run.sh" ]