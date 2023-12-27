FROM ruby:3.3.0

WORKDIR /usr/src/app

COPY Gemfile ./
RUN gem install bundler
RUN bundle install

COPY . .

RUN apt-get update && apt-get install -y vim

RUN grpc_tools_ruby_protoc -I pb --ruby_out=./lib --grpc_out=./lib pb/user.proto

ENV RUBYLIB=./lib

CMD ["ruby", "user_server.rb"]
