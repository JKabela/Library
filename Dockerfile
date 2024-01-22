# Use a smaller base image
FROM ruby:3.0.3-slim

# Set environment variables
ENV RAILS_VERSION 7.0.6

# Set working directory
WORKDIR /myapp

# Install dependencies
RUN apt-get update -y \
    && apt-get install -y --no-install-recommends \
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
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Rails and RubyGems
RUN gem install rails -v $RAILS_VERSION

# Copy application files
COPY . .

# Install application gems
RUN bundle config --local deployment true \
    && bundle config --local without 'development test' \
    && bundle install --jobs 4 --retry 3 \
    && rm -rf /usr/local/bundle/cache

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
