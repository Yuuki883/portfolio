FROM ruby:2.5.7

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install -j4

ADD . /app

RUN rails assets:precompile

EXPOSE 3000

