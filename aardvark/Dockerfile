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

# Update the repository and install aardvark.
# I think this already happens above
RUN apt-get update && \
    pip install .

# Create aardvark configuration.
ARG AARDVARK_CONFIG_DIR="/etc/aardvark"
ARG AARDVARK_ROLE=""
ARG AARDVARK_DB_URI=""
ARG AARDVARK_DATA_DIR

RUN mkdir -p $AARDVARK_CONFIG_DIR
WORKDIR $AARDVARK_CONFIG_DIR

RUN if [ -z "$AARDVARK_DB_URI" -a -n "$AARDVARK_DATA_DIR" ] ; then \
		AARDVARK_DB_URI="sqlite:///$AARDVARK_DATA_DIR/aardvark.db"; \
		fi; \
	AARDVARK_CONFIG_OPTIONS=$( \
		printf "%s%s%s" \
			"$(if [ -n "$AARDVARK_ROLE" ] ; then echo "-a $AARDVARK_ROLE "; fi)" \
			"$(if [ -n "$AARDVARK_DB_URI" ] ; then echo "-d $AARDVARK_DB_URI "; fi)" \
		); \
	aardvark config --no-prompt $AARDVARK_CONFIG_OPTIONS

FROM alpine

ADD bin/run.sh /app

RUN chmod +x run.sh
ENTRYPOINT [ "./run.sh" ]