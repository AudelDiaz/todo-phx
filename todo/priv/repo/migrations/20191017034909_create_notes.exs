defmodule Todo.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :text, :string
      add :status, :boolean, default: false, null: false

      timestamps()
    end

  end
end
