FROM ruby:2.6.5
MAINTAINER Alexander Kadyrov <gruz0.mail@gmail.com>

RUN echo '\
Dpkg {\n\
  Cache "";\n\
  Cache::archives "";\n\
  Post-Invoke {"rm -rf /var/lib/apt/lists";};\n\
}\n\
APT {\n\
  Install-Recommends "false";\n\
}\n\
DSELECT::Clean "always";' >> /etc/apt/apt.conf.d/docker-no-cache

RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev postgresql-client-11 && \
    gem install bundler && \
    mkdir /app

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install
COPY . /app

EXPOSE 3000
CMD ./docker-entrypoint.sh
