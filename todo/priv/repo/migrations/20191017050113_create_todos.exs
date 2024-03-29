defmodule Todo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :text, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
