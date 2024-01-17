FROM ruby:3.2.2
USER root

ARG DEBIAN_FRONTEND=noninteractive

# Set environment variables
ENV RUBY_VERSION 3.2.2
ENV RAILS_VERSION 7.0.6

WORKDIR /myapp

RUN apt-get update --fix-missing && apt-get install -y \
          build-essential \
          default-libmysqlclient-dev \
          libssl-dev \
          libreadline-dev \
          zlib1g-dev \
          curl \
          git-core \
          libxml2-dev \
          libxslt1-dev \
          libyaml-dev \
          libcurl4-openssl-dev \
          libffi-dev \
          nodejs \
          imagemagick \
          libmagickwand-dev \
          sudo \
          postgresql-client \
          lsb-release \
          cron \
		  rake \
		  vim

# Install Rails
RUN gem install rails -v $RAILS_VERSION

# Install RubyGems
RUN gem update --system

# Cleaning
RUN rm -rf /tmp/*

# Add application files
COPY . .

# set up cron job
RUN echo "*/5 * * * * curl http://164.92.188.100:31000/newbook >> /var/log/cron_log.log 2>&1" | crontab -


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

RUN useradd rails --create-home --shell /bin/bash 

EXPOSE 3000
# Start the server by default, this can be overwritten at runtime

CMD ["rails", "server", "-b", "0.0.0.0"]