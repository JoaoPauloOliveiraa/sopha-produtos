FROM ruby:3.0.3
RUN apt-get update -qq
RUN apt-get install -y \
    postgresql-client \
    git \
    imagemagick \
    nodejs \
    && apt-get autoclean \ && apt-get autoremove -y

RUN mkdir crud-sopha
WORKDIR /crud-sopha

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ADD Gemfile* /crud-sopha/
RUN bundle check || bundle install
ADD . crud-sopha
ENTRYPOINT [ "entrypoint.sh" ]
CMD RAILS_ENV=${RAILS_ENV} bundle exec rails db:create db:migrate && bundle exec rails s -p ${PORT} -b '0.0.0.0'
