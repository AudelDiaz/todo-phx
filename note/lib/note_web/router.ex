defmodule NoteWeb.Router do
  use NoteWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", NoteWeb do
    pipe_through(:api)
    resources("/notes", NoteApiController, except: [:new, :edit])
  end
end
