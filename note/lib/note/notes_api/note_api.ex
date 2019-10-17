defmodule Note.NotesApi.NoteApi do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(note_api, attrs) do
    note_api
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
