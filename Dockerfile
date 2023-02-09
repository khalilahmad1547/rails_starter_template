FROM ruby:3.1.3-slim-buster
RUN apt-get update \
  && apt upgrade -y \
  && apt install build-essential libpq-dev -y \
  && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY . .

ENV SECRET_KEY_BASE=key
ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV PORT=3000
ENV DATABASE_HOST=localhost
ENV DATABASE_PORT=5432
ENV PRODUCTION_DATABASE_USRENAME=postgres
ENV PRODUCTION_DATABASE_PASSWORD=postgres
ENV PRODUCTION_DATABASE_NAME=postgres

RUN bundle install
RUN chmod +x ./startup.sh
CMD ["/bin/bash", "./startup.sh"]