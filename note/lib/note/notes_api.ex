defmodule Note.NotesApi do
  @moduledoc """
  The NotesAPI context.
  """

  import Ecto.Query, warn: false
  alias Note.Repo

  alias Note.NotesApi.NoteApi

  @doc """
  Returns the list of notes.

  ## Examples

      iex> list_notes()
      [%NoteApi{}, ...]

  """
  def list_notes do
    Repo.all(NoteApi)
  end

  @doc """
  Gets a single note_api.

  Raises `Ecto.NoResultsError` if the Note api does not exist.

  ## Examples

      iex> get_note_api!(123)
      %NoteApi{}

      iex> get_note_api!(456)
      ** (Ecto.NoResultsError)

  """
  def get_note_api!(id), do: Repo.get!(NoteApi, id)

  @doc """
  Creates a note_api.

  ## Examples

      iex> create_note_api(%{field: value})
      {:ok, %NoteApi{}}

      iex> create_note_api(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_note_api(attrs \\ %{}) do
    %NoteApi{}
    |> NoteApi.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a note_api.

  ## Examples

      iex> update_note_api(note_api, %{field: new_value})
      {:ok, %NoteApi{}}

      iex> update_note_api(note_api, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_note_api(%NoteApi{} = note_api, attrs) do
    note_api
    |> NoteApi.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a NoteApi.

  ## Examples

      iex> delete_note_api(note_api)
      {:ok, %NoteApi{}}

      iex> delete_note_api(note_api)
      {:error, %Ecto.Changeset{}}

  """
  def delete_note_api(%NoteApi{} = note_api) do
    Repo.delete(note_api)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking note_api changes.

  ## Examples

      iex> change_note_api(note_api)
      %Ecto.Changeset{source: %NoteApi{}}

  """
  def change_note_api(%NoteApi{} = note_api) do
    NoteApi.changeset(note_api, %{})
  end
end
