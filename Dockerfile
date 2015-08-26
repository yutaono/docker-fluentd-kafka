FROM ubuntu
MAINTAINER YUTA ONO
 
RUN apt-get update && apt-get install -y --force-yes libssl0.9.8 curl build-essential
 
RUN curl -L http://toolbelt.treasuredata.com/sh/install-ubuntu-trusty-td-agent2.sh | sh && mkdir -p /var/log/td-agent
 
ENV GEM_HOME /opt/td-agent/embedded/lib/ruby/gems/2.1.0/
ENV GEM_PATH /opt/td-agent/embedded/lib/ruby/gems/2.1.0/
ENV PATH /opt/td-agent/embedded/bin/:$PATH

ADD ./fluent.conf /etc/td-agent/td-agent.conf
RUN gem install fluent-plugin-kafka --no-ri --no-rdoc
RUN mkdir -p /var/log/app

CMD td-agent

