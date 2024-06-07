FROM ruby:3.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
WORKDIR /usr/src/app
COPY Gemfile ./
RUN bundle install

EXPOSE 4000
