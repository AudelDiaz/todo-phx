FROM elixir:1.9
ENV PHX_VERSION=1.4.8
ENV MIX_ENV=dev
WORKDIR /usr/src/myapp
RUN apt update \
    && apt install -y build-essential \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt install -y nodejs inotify-tools \
    && apt autoremove
RUN mix local.hex --force \
    && mix local.rebar --force \
    && mix archive.install hex phx_new $PHX_VERSION --force
COPY mix.exs mix.lock assets ./
RUN mix deps.get \
    && mix deps.compile