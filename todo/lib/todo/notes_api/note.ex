defmodule Todo.NotesApi.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :status, :boolean, default: false
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:text, :status])
    |> validate_required([:text, :status])
  end
end
