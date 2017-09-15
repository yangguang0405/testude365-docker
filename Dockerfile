FROM ubuntu:16.04

# Work in app dir by default.
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install required packages
RUN apt-get update && \
    apt-get --assume-yes install openjdk-8-jdk build-essential wget curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev && \
    wget "https://nodejs.org/download/release/latest-v8.x/node-v8.5.0-linux-x64.tar.gz" && \
    tar -xvf node-v8.5.0-linux-x64 && \
    export PATH=$PATH:~/node-v8.5.0-linux-x64/bin && \
    npm install -g appium


#     ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)" && \
#     test -d ~/.linuxbrew && PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH" && \
#     test -d /home/linuxbrew/.linuxbrew && PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH" && \
#     test -r ~/.bash_profile && echo 'export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"' >>~/.bash_profile && \
#     brew update && \
#     brew install node && \
#     brew link node && \
#     npm install -g appium && \
#     npm install wd

# echo 'export PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"' >>~/.profile
#    wget "https://nodejs.org/download/release/latest-v8.x/node-v8.5.0-linux-x64.tar.gz" && \
#    tar -xvf node-v8.5.0-linux-x64 && \
#    export PATH=$PATH:~/node-v8.5.0-linux-x64/bin && \


# Run app.py when the container launches
CMD ["appium"]
