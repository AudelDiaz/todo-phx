FROM elixir:1.9-alpine
LABEL description="PhoenixFramework development environment" \
      maintainer="audel.diaz@outlook.com" \
      version="1.0"
ENV PHX_VERSION=1.4.8
ENV MIX_ENV=dev
WORKDIR /usr/src/myapp
RUN apk add --update npm inotify-tools \
    && rm -rf /var/cache/apk/*
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install hex phx_new $PHX_VERSION --force
COPY mix.exs mix.lock assets ./
RUN mix deps.get \
    && mix deps.compile
EXPOSE 4000