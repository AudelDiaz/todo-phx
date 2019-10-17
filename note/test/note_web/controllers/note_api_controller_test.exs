defmodule NoteWeb.NoteApiControllerTest do
  use NoteWeb.ConnCase

  alias Note.NotesApi
  alias Note.NotesApi.NoteApi

  @create_attrs %{
    body: "some body",
    title: "some title"
  }
  @update_attrs %{
    body: "some updated body",
    title: "some updated title"
  }
  @invalid_attrs %{body: nil, title: nil}

  def fixture(:note_api) do
    {:ok, note_api} = NotesApi.create_note_api(@create_attrs)
    note_api
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notes", %{conn: conn} do
      conn = get(conn, Routes.note_api_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create note_api" do
    test "renders note_api when data is valid", %{conn: conn} do
      conn = post(conn, Routes.note_api_path(conn, :create), note_api: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.note_api_path(conn, :show, id))

      assert %{
               "id" => id,
               "body" => "some body",
               "title" => "some title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.note_api_path(conn, :create), note_api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update note_api" do
    setup [:create_note_api]

    test "renders note_api when data is valid", %{conn: conn, note_api: %NoteApi{id: id} = note_api} do
      conn = put(conn, Routes.note_api_path(conn, :update, note_api), note_api: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.note_api_path(conn, :show, id))

      assert %{
               "id" => id,
               "body" => "some updated body",
               "title" => "some updated title"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, note_api: note_api} do
      conn = put(conn, Routes.note_api_path(conn, :update, note_api), note_api: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete note_api" do
    setup [:create_note_api]

    test "deletes chosen note_api", %{conn: conn, note_api: note_api} do
      conn = delete(conn, Routes.note_api_path(conn, :delete, note_api))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.note_api_path(conn, :show, note_api))
      end
    end
  end

  defp create_note_api(_) do
    note_api = fixture(:note_api)
    {:ok, note_api: note_api}
  end
end
