defmodule Note.Repo.Migrations.CreateNoteNotes do
  use Ecto.Migration

  def change do
    create table(:note_notes) do
      add :title, :string
      add :body, :text

      timestamps()
    end

  end
end
