defmodule NoteWeb.NoteApiController do
  use NoteWeb, :controller

  alias Note.NotesApi
  alias Note.NotesApi.NoteApi

  action_fallback(NoteWeb.FallbackController)

  def index(conn, _params) do
    notes = NotesApi.list_notes()
    render(conn, "index.json", notes: notes)
  end

  def create(conn, %{} = note_api_params) do
    with {:ok, %NoteApi{} = note_api} <- NotesApi.create_note_api(note_api_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.note_api_path(conn, :show, note_api))
      |> render("show.json", note_api: note_api)
    end
  end

  def show(conn, %{"id" => id}) do
    note_api = NotesApi.get_note_api!(id)
    render(conn, "show.json", note_api: note_api)
  end

  def update(conn, %{"id" => id, "note_api" => note_api_params}) do
    note_api = NotesApi.get_note_api!(id)

    with {:ok, %NoteApi{} = note_api} <- NotesApi.update_note_api(note_api, note_api_params) do
      render(conn, "show.json", note_api: note_api)
    end
  end

  def delete(conn, %{"id" => id}) do
    note_api = NotesApi.get_note_api!(id)

    with {:ok, %NoteApi{}} <- NotesApi.delete_note_api(note_api) do
      send_resp(conn, :no_content, "")
    end
  end
end
