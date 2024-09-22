FROM ruby:3.2

RUN apt-get update -qq && apt-get install -y nodejs default-mysql-client build-essential libmariadb-dev

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install

COPY . .

RUN chmod +x wait-for-it.sh

EXPOSE 3000

CMD ["bash", "-c", "./wait-for-it.sh db:3306 -- rm -f tmp/pids/server.pid && bundle exec rails server -b 0.0.0.0"]
