# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.2.0
FROM ruby:$RUBY_VERSION-slim AS base

WORKDIR /rails

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libpq-dev \
    libjemalloc2 \
    libvips \
    git && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development

FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    libpq-dev \
    git \
    node-gyp \
    pkg-config \
    python-is-python3 && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

ARG NODE_VERSION=20.17.0
ARG YARN_VERSION=1.22.22
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "$NODE_VERSION" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

COPY Gemfile Gemfile.lock /rails/
RUN bundle install && \
    rm -rf ~/.bundle/ "$BUNDLE_PATH"/ruby/*/cache "$BUNDLE_PATH"/ruby/*/bundler/gems/*/.git

COPY package.json yarn.lock /rails/
RUN yarn install --frozen-lockfile

COPY . /rails

RUN bundle exec bootsnap precompile app/ lib/
RUN chmod +x ./bin/rails

ARG DATABASE_URL
ARG SECRET_KEY_BASE
ENV DATABASE_URL=$DATABASE_URL
ENV SECRET_KEY_BASE=$SECRET_KEY_BASE
RUN DATABASE_URL=$DATABASE_URL RAILS_ENV=production SECRET_KEY_BASE=$SECRET_KEY_BASE bundle exec rails assets:precompile

RUN rm -rf node_modules

FROM base

COPY --from=build "$BUNDLE_PATH" "$BUNDLE_PATH"
COPY --from=build /rails /rails

RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails /rails

USER rails

WORKDIR /rails
ENTRYPOINT ["./bin/rails"]
EXPOSE 3000

CMD ["server", "-b", "0.0.0.0", "-p", "3000"]
