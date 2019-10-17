#!/bin/sh
mix deps.get
mix deps.compile
mix phx.digest
mix phx.server
