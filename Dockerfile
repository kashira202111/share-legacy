FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
 && rm -rf /var/lib/apt/lists/*

RUN touch /tmp/mysql.sock
RUN chmod 777 /tmp/mysql.sock
RUN ls -la /tmp/
RUN gem install bundler
ENV APP_HOME /myapp
WORKDIR ${APP_HOME}
ADD . $APP_HOME
RUN bundle install
