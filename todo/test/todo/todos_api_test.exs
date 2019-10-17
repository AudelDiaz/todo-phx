defmodule Todo.TodosApiTest do
  use Todo.DataCase

  alias Todo.TodosApi

  describe "todos" do
    alias Todo.TodosApi.TodoApi

    @valid_attrs %{status: true, text: "some text"}
    @update_attrs %{status: false, text: "some updated text"}
    @invalid_attrs %{status: nil, text: nil}

    def todo_api_fixture(attrs \\ %{}) do
      {:ok, todo_api} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TodosApi.create_todo_api()

      todo_api
    end

    test "list_todos/0 returns all todos" do
      todo_api = todo_api_fixture()
      assert TodosApi.list_todos() == [todo_api]
    end

    test "get_todo_api!/1 returns the todo_api with given id" do
      todo_api = todo_api_fixture()
      assert TodosApi.get_todo_api!(todo_api.id) == todo_api
    end

    test "create_todo_api/1 with valid data creates a todo_api" do
      assert {:ok, %TodoApi{} = todo_api} = TodosApi.create_todo_api(@valid_attrs)
      assert todo_api.status == true
      assert todo_api.text == "some text"
    end

    test "create_todo_api/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodosApi.create_todo_api(@invalid_attrs)
    end

    test "update_todo_api/2 with valid data updates the todo_api" do
      todo_api = todo_api_fixture()
      assert {:ok, %TodoApi{} = todo_api} = TodosApi.update_todo_api(todo_api, @update_attrs)
      assert todo_api.status == false
      assert todo_api.text == "some updated text"
    end

    test "update_todo_api/2 with invalid data returns error changeset" do
      todo_api = todo_api_fixture()
      assert {:error, %Ecto.Changeset{}} = TodosApi.update_todo_api(todo_api, @invalid_attrs)
      assert todo_api == TodosApi.get_todo_api!(todo_api.id)
    end

    test "delete_todo_api/1 deletes the todo_api" do
      todo_api = todo_api_fixture()
      assert {:ok, %TodoApi{}} = TodosApi.delete_todo_api(todo_api)
      assert_raise Ecto.NoResultsError, fn -> TodosApi.get_todo_api!(todo_api.id) end
    end

    test "change_todo_api/1 returns a todo_api changeset" do
      todo_api = todo_api_fixture()
      assert %Ecto.Changeset{} = TodosApi.change_todo_api(todo_api)
    end
  end
end
