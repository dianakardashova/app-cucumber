FROM ruby:2.3-slim-stretch

RUN gem install bundler:1.16.1 \
                cucumber:2.4.0 \
                rspec:3.5.0 \
                excon \
                pry

WORKDIR /opt/project
ENTRYPOINT ["cucumber", "--require", "blackbox-test/features", "blackbox-test/features"]