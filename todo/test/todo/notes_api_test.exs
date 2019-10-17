defmodule Todo.NotesApiTest do
  use Todo.DataCase

  alias Todo.NotesApi

  describe "notes" do
    alias Todo.NotesApi.Note

    @valid_attrs %{status: true, text: "some text"}
    @update_attrs %{status: false, text: "some updated text"}
    @invalid_attrs %{status: nil, text: nil}

    def note_fixture(attrs \\ %{}) do
      {:ok, note} =
        attrs
        |> Enum.into(@valid_attrs)
        |> NotesApi.create_note()

      note
    end

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert NotesApi.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert NotesApi.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      assert {:ok, %Note{} = note} = NotesApi.create_note(@valid_attrs)
      assert note.status == true
      assert note.text == "some text"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NotesApi.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      assert {:ok, %Note{} = note} = NotesApi.update_note(note, @update_attrs)
      assert note.status == false
      assert note.text == "some updated text"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = NotesApi.update_note(note, @invalid_attrs)
      assert note == NotesApi.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = NotesApi.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> NotesApi.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = NotesApi.change_note(note)
    end
  end
end
