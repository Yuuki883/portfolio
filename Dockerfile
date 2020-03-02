FROM ruby:2.5.7
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
    libpq-dev \        
    nodejs           


WORKDIR /docker_rails

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock


RUN bundle install
ADD . $APP_ROOT