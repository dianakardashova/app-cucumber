FROM ruby:2.3-slim-stretch

RUN gem install sinatra:2.0.1
RUN gem install daybreak


RUN mkdir -p /opt/project/app
COPY ./app/ /opt/project/app/

EXPOSE 2701

ENTRYPOINT ["ruby", "/opt/project/app/app.rb"]