FROM ruby:3.0.4

ARG PG_MAJOR=14
ARG NODE_MAJOR=14
ARG YARN_VERSION=1.22.19
ARG BUNDLED_WITH=2.2.33

# 一般的な依存関係をインストール
RUN apt-get update -qq\
  && apt-get install -yq --no-install-recommends\
    build-essential\
    gnupg2\
    curl\
    less\
    git\
    vim\
  && apt-get clean\
  && rm -rf /var/cache/apt/archives/*\
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
  && truncate -s 0 /var/log/*log

# posgresqlの依存関係をインストール
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc |\
    gpg --dearmor -o /usr/share/keyrings/postgres-archive-keyring.gpg\
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/postgres-archive-keyring.gpg] https://apt.postgresql.org/pub/repos/apt/"\
    bullseye-pgdg main $PG_MAJOR | tee /etc/apt/sources.list.d/postgres.list > /dev/null
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends\
    libpq-dev\
    postgresql-client-$PG_MAJOR\
    && apt-get clean\
    && rm -rf /var/cache/apt/archives/*\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
    && truncate -s 0 /var/log/*log


# NodeJSとYarnをインストール
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade &&\
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends\
    nodejs\
    && apt-get clean\
    && rm -rf /var/cache/apt/archives/*\
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*\
    && truncate -s 0 /var/log/*log
RUN npm install -g yarn@$YARN_VERSION

RUN mkdir /recorda-me
WORKDIR /recorda-me

COPY Gemfile /recorda-me
COPY Gemfile.lock /recorda-me
RUN gem install bundler -v $BUNDLED_WITH
RUN bundle install

COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]