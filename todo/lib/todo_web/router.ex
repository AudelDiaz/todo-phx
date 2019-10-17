defmodule TodoWeb.Router do
  use TodoWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", TodoWeb do
    pipe_through(:api)
    resources("/notes", NoteController, except: [:new, :edit])
  end
end
