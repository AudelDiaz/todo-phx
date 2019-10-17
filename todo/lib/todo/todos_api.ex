defmodule Todo.TodosApi do
  @moduledoc """
  The TodosApi context.
  """

  import Ecto.Query, warn: false
  alias Todo.Repo

  alias Todo.TodosApi.TodoApi

  @doc """
  Returns the list of todos.

  ## Examples

      iex> list_todos()
      [%TodoApi{}, ...]

  """
  def list_todos do
    Repo.all(TodoApi)
  end

  @doc """
  Gets a single todo_api.

  Raises `Ecto.NoResultsError` if the Todo api does not exist.

  ## Examples

      iex> get_todo_api!(123)
      %TodoApi{}

      iex> get_todo_api!(456)
      ** (Ecto.NoResultsError)

  """
  def get_todo_api!(id), do: Repo.get!(TodoApi, id)

  @doc """
  Creates a todo_api.

  ## Examples

      iex> create_todo_api(%{field: value})
      {:ok, %TodoApi{}}

      iex> create_todo_api(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_todo_api(attrs \\ %{}) do
    %TodoApi{}
    |> TodoApi.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a todo_api.

  ## Examples

      iex> update_todo_api(todo_api, %{field: new_value})
      {:ok, %TodoApi{}}

      iex> update_todo_api(todo_api, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_todo_api(%TodoApi{} = todo_api, attrs) do
    todo_api
    |> TodoApi.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TodoApi.

  ## Examples

      iex> delete_todo_api(todo_api)
      {:ok, %TodoApi{}}

      iex> delete_todo_api(todo_api)
      {:error, %Ecto.Changeset{}}

  """
  def delete_todo_api(%TodoApi{} = todo_api) do
    Repo.delete(todo_api)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking todo_api changes.

  ## Examples

      iex> change_todo_api(todo_api)
      %Ecto.Changeset{source: %TodoApi{}}

  """
  def change_todo_api(%TodoApi{} = todo_api) do
    TodoApi.changeset(todo_api, %{})
  end
end
