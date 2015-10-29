FROM        ubuntu:latest
MAINTAINER  Wojciech Gaca <wmgaca@gmail.com>

RUN         apt-get update -y && \
            apt-get install -y wget \
                               ruby \
                               ruby-dev \
                               python \
                               python-dev \
                               git \
                               facter \
                               python \
                               python-pip

RUN         gem install bundler \
                        aws-sdk-core \
                        retries

RUN         pip install awscli

RUN         wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb && \
            dpkg -i puppetlabs-release-pc1-trusty.deb && \
            apt-get install -y puppet

RUN         cd /opt && \
            git clone --depth 1 --branch 4.2.2 https://github.com/puppetlabs/puppet.git && \
            cd puppet && \
            ./install.rb

RUN         puppet module install puppetlabs-aws
