defmodule NoteWeb.NoteApiView do
  use NoteWeb, :view
  alias NoteWeb.NoteApiView

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NoteApiView, "note_api.json")}
  end

  def render("show.json", %{note_api: note_api}) do
    %{data: render_one(note_api, NoteApiView, "note_api.json")}
  end

  def render("note_api.json", %{note_api: note_api}) do
    %{id: note_api.id,
      title: note_api.title,
      body: note_api.body}
  end
end
