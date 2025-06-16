# Use official Ruby image
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && \
  apt-get install -y build-essential libpq-dev nodejs && \
  rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /srv/jekyll

# Accept build arg for Gemfile location
ARG GEMFILE_DIR=scripts

# Copy Gemfile and Gemfile.lock from scripts
COPY ${GEMFILE_DIR}/Gemfile* ./

RUN if [ -f Gemfile ]; then \
  gem install bundler && bundle install; \
  else \
  gem install jekyll bundler; \
  fi

# Copy the rest of the site (excluding scripts dir)
COPY . .

# Default command
CMD ["jekyll", "serve", "--host", "0.0.0.0"]
