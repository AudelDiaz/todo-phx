defmodule Note.NotesAPITest do
  use Note.DataCase

  alias Note.NotesAPI

  describe "notes" do
    alias Note.NotesAPI.NoteAPI

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def note_api_fixture(attrs \\ %{}) do
      {:ok, note_api} =
        attrs
        |> Enum.into(@valid_attrs)
        |> NotesAPI.create_note_api()

      note_api
    end

    test "list_notes/0 returns all notes" do
      note_api = note_api_fixture()
      assert NotesAPI.list_notes() == [note_api]
    end

    test "get_note_api!/1 returns the note_api with given id" do
      note_api = note_api_fixture()
      assert NotesAPI.get_note_api!(note_api.id) == note_api
    end

    test "create_note_api/1 with valid data creates a note_api" do
      assert {:ok, %NoteAPI{} = note_api} = NotesAPI.create_note_api(@valid_attrs)
      assert note_api.body == "some body"
      assert note_api.title == "some title"
    end

    test "create_note_api/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NotesAPI.create_note_api(@invalid_attrs)
    end

    test "update_note_api/2 with valid data updates the note_api" do
      note_api = note_api_fixture()
      assert {:ok, %NoteAPI{} = note_api} = NotesAPI.update_note_api(note_api, @update_attrs)
      assert note_api.body == "some updated body"
      assert note_api.title == "some updated title"
    end

    test "update_note_api/2 with invalid data returns error changeset" do
      note_api = note_api_fixture()
      assert {:error, %Ecto.Changeset{}} = NotesAPI.update_note_api(note_api, @invalid_attrs)
      assert note_api == NotesAPI.get_note_api!(note_api.id)
    end

    test "delete_note_api/1 deletes the note_api" do
      note_api = note_api_fixture()
      assert {:ok, %NoteAPI{}} = NotesAPI.delete_note_api(note_api)
      assert_raise Ecto.NoResultsError, fn -> NotesAPI.get_note_api!(note_api.id) end
    end

    test "change_note_api/1 returns a note_api changeset" do
      note_api = note_api_fixture()
      assert %Ecto.Changeset{} = NotesAPI.change_note_api(note_api)
    end
  end

  describe "notes" do
    alias Note.NotesApi.NoteApi

    @valid_attrs %{body: "some body", title: "some title"}
    @update_attrs %{body: "some updated body", title: "some updated title"}
    @invalid_attrs %{body: nil, title: nil}

    def note_api_fixture(attrs \\ %{}) do
      {:ok, note_api} =
        attrs
        |> Enum.into(@valid_attrs)
        |> NotesApi.create_note_api()

      note_api
    end

    test "list_notes/0 returns all notes" do
      note_api = note_api_fixture()
      assert NotesApi.list_notes() == [note_api]
    end

    test "get_note_api!/1 returns the note_api with given id" do
      note_api = note_api_fixture()
      assert NotesApi.get_note_api!(note_api.id) == note_api
    end

    test "create_note_api/1 with valid data creates a note_api" do
      assert {:ok, %NoteApi{} = note_api} = NotesApi.create_note_api(@valid_attrs)
      assert note_api.body == "some body"
      assert note_api.title == "some title"
    end

    test "create_note_api/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NotesApi.create_note_api(@invalid_attrs)
    end

    test "update_note_api/2 with valid data updates the note_api" do
      note_api = note_api_fixture()
      assert {:ok, %NoteApi{} = note_api} = NotesApi.update_note_api(note_api, @update_attrs)
      assert note_api.body == "some updated body"
      assert note_api.title == "some updated title"
    end

    test "update_note_api/2 with invalid data returns error changeset" do
      note_api = note_api_fixture()
      assert {:error, %Ecto.Changeset{}} = NotesApi.update_note_api(note_api, @invalid_attrs)
      assert note_api == NotesApi.get_note_api!(note_api.id)
    end

    test "delete_note_api/1 deletes the note_api" do
      note_api = note_api_fixture()
      assert {:ok, %NoteApi{}} = NotesApi.delete_note_api(note_api)
      assert_raise Ecto.NoResultsError, fn -> NotesApi.get_note_api!(note_api.id) end
    end

    test "change_note_api/1 returns a note_api changeset" do
      note_api = note_api_fixture()
      assert %Ecto.Changeset{} = NotesApi.change_note_api(note_api)
    end
  end
end
