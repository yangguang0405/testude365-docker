FROM ubuntu:16.04

#===========================
# Work in app dir by default.
#===========================
WORKDIR /app

#===========================
# Copy the current directory contents into the container at /app
#===========================
ADD . /app

#===========================
# Install required packages
#===========================
# openjdk-8-jdk
#   Java
# ca-certificates
#   SSL client
# tzdata
#   Timezone
# unzip
#   Unzip zip file
# curl
#   Transfer data from or to a server
# wget
#   Network downloader
# libqt5webkit5
#   Web content engine (Fix issue in Android)
# libgconf-2-4
#   Required package for chrome and chromedriver to run on Linux
# xvfb
#   X virtual framebuffer
#==================

RUN apt-get -qqy update && \
    apt-get -qqy --no-install-recommends install \
    openjdk-8-jdk \
    ca-certificates \
    tzdata \
    unzip \
    curl \
    wget \
    libqt5webkit5 \
    libgconf-2-4 \
    xvfb \
&& rm -rf /var/lib/apt/lists/*

#===============
# Set JAVA_HOME
#===============
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre" \
PATH=$PATH:$JAVA_HOME/bin


#====================================
# Install latest nodejs, npm, appium
#====================================
ARG APPIUM_VERSION=1.7.0-beta
ENV APPIUM_VERSION=$APPIUM_VERSION

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get -qqy install nodejs && \
    npm install -g appium@${APPIUM_VERSION} && \
    npm cache clean && \
    apt-get remove --purge -y npm && \
    apt-get autoremove --purge -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get clean

#==================================
# Fix Issue with timezone mismatch
#==================================
ENV TZ="US/Pacific"
RUN echo "${TZ}" > /etc/timezone


# Run run.sh when the container launches
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh
