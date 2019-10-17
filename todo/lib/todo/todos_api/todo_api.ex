defmodule Todo.TodosApi.TodoApi do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :status, :boolean, default: false
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(todo_api, attrs) do
    todo_api
    |> cast(attrs, [:text, :status])
    |> validate_required([:text, :status])
  end
end
