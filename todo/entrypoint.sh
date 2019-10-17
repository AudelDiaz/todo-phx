#!/bin/sh
mix deps.get
mix deps.compile
mix ecto.migrate
mix phx.server