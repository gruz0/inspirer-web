FROM ruby:2.6.5-alpine
MAINTAINER Alexander Kadyrov <gruz0.mail@gmail.com>

RUN apk --update add --no-cache build-base tzdata nodejs postgresql-dev postgresql-client

# Create an user for running the application
RUN adduser -D inspirer
USER inspirer
WORKDIR /home/inspirer

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY --chown=inspirer Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle install --jobs 20 --retry 5

COPY --chown=inspirer . ./

EXPOSE 3000
CMD ./docker-entrypoint.sh
