FROM ruby:2.5.7

RUN apt-get update -qq && \
  apt-get install -y apt-utils \
  build-essential \
  libpq-dev \
  nodejs \
  vim \
  default-mysql-client

RUN curl -O https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN curl -O https://chromedriver.storage.googleapis.com/2.31/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip

WORKDIR /app

ADD Gemfile .
ADD Gemfile.lock .
RUN bundle install -j4

ADD . /app

RUN rails assets:precompile

EXPOSE 3000

