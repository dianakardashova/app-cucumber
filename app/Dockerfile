FROM ruby:2.3.7-alpine3.7

WORKDIR /code
COPY . /code
RUN bundle install --no-cache

EXPOSE 4567

ENTRYPOINT ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "4567"]