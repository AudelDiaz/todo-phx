defmodule TodoWeb.NoteController do
  use TodoWeb, :controller

  alias Todo.NotesApi
  alias Todo.NotesApi.Note

  action_fallback(TodoWeb.FallbackController)

  def index(conn, _params) do
    notes = NotesApi.list_notes()
    render(conn, "index.json", notes: notes)
  end

  def create(conn, %{} = note_params) do
    with {:ok, %Note{} = note} <- NotesApi.create_note(note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.note_path(conn, :show, note))
      |> render("show.json", note: note)
    end
  end

  def show(conn, %{"id" => id}) do
    note = NotesApi.get_note!(id)
    render(conn, "show.json", note: note)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = NotesApi.get_note!(id)

    with {:ok, %Note{} = note} <- NotesApi.update_note(note, note_params) do
      render(conn, "show.json", note: note)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = NotesApi.get_note!(id)

    with {:ok, %Note{}} <- NotesApi.delete_note(note) do
      send_resp(conn, :no_content, "")
    end
  end
end
