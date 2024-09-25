# syntax = docker/dockerfile:1

# Use a specific Ruby version from a slim image for production
ARG RUBY_VERSION=3.2.0
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# Set working directory inside the container
WORKDIR /rails

# Install necessary packages
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl libpq-dev libjemalloc2 libvips git && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set environment variables for production
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"

# Build stage to install gems and node modules
FROM base AS build

# Install build dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev git node-gyp pkg-config python-is-python3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Install Node.js and Yarn
ARG NODE_VERSION=20.17.0
ARG YARN_VERSION=1.22.22
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

# Install application gems
COPY railsapp/Gemfile railsapp/Gemfile.lock ./ 
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# Install node modules (including font-awesome and other JS dependencies)
COPY railsapp/package.json railsapp/yarn.lock ./ 
RUN yarn install --frozen-lockfile

# Copy application code to container
COPY railsapp /rails

# Precompile bootsnap and assets
RUN bundle exec bootsnap precompile app/ lib/
RUN chmod +x ./bin/rails

# Precompile assets with SECRET_KEY_BASE
ARG DATABASE_URL
ARG SECRET_KEY_BASE
ENV DATABASE_URL=$DATABASE_URL
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE
RUN DATABASE_URL=$DATABASE_URL RAILS_ENV=production SECRET_KEY_BASE=$SECRET_KEY_BASE ./bin/rails assets:precompile

# Optionally remove node_modules after asset precompilation if not needed at runtime
RUN rm -rf node_modules

# Final stage for production image
FROM base

# Copy built artifacts from build stage
COPY --from=build "${BUNDLE_PATH}" "${BUNDLE_PATH}"
COPY --from=build /rails /rails

# Set proper file permissions and ownership
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp
USER 1000:1000

# Set entrypoint and expose necessary port
ENTRYPOINT ["./bin/rails"]
EXPOSE 3000

# Default command to run the Rails server
CMD ["server", "-b", "0.0.0.0", "-p", "3000"]
