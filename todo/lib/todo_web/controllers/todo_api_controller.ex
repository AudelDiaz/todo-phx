defmodule TodoWeb.TodoApiController do
  use TodoWeb, :controller

  alias Todo.TodosApi
  alias Todo.TodosApi.TodoApi

  action_fallback TodoWeb.FallbackController

  def index(conn, _params) do
    todos = TodosApi.list_todos()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, %{"todo_api" => todo_api_params}) do
    with {:ok, %TodoApi{} = todo_api} <- TodosApi.create_todo_api(todo_api_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todo_api_path(conn, :show, todo_api))
      |> render("show.json", todo_api: todo_api)
    end
  end

  def show(conn, %{"id" => id}) do
    todo_api = TodosApi.get_todo_api!(id)
    render(conn, "show.json", todo_api: todo_api)
  end

  def update(conn, %{"id" => id, "todo_api" => todo_api_params}) do
    todo_api = TodosApi.get_todo_api!(id)

    with {:ok, %TodoApi{} = todo_api} <- TodosApi.update_todo_api(todo_api, todo_api_params) do
      render(conn, "show.json", todo_api: todo_api)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo_api = TodosApi.get_todo_api!(id)

    with {:ok, %TodoApi{}} <- TodosApi.delete_todo_api(todo_api) do
      send_resp(conn, :no_content, "")
    end
  end
end
