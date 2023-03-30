FROM ruby:3.1.3

RUN apt-get update && apt-get install -y --no-install-recommends \
    nodejs  \
    postgresql-client  \
    build-essential  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
WORKDIR /design_support

COPY Gemfile /design_support/Gemfile
COPY Gemfile.lock /design_support/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /design_support

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]