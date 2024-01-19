FROM ruby:3.2.2

# Set environment variables
ENV RUBY_VERSION 3.2.2
ENV RAILS_VERSION 7.0.6

WORKDIR /myapp

# Install dependencies
RUN apt-get update -y && apt-get install -y \
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
    vim \
 && rm -rf /var/lib/apt/lists/*

# Install Rails and RubyGems
RUN gem install rails -v $RAILS_VERSION \
 && gem update --system \
 && rm -rf /tmp/*

# Add application files
COPY . .

#Installing application gems
RUN bundle install

#Create and migrate DB
rake db:create
rake db:migrate

#Start cron
service cron start

# Set up cron job
RUN echo "*/5 * * * * curl http://164.92.188.100:31000/newbook >> /var/log/cron_log.log 2>&1" | crontab -

# Add entrypoint script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Create a non-root user
RUN useradd -m -s /bin/bash rails

# Expose port and define default command
EXPOSE 3000
ENTRYPOINT ["entrypoint.sh"]
CMD ["rails", "server", "-b", "0.0.0.0"]