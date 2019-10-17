defmodule TodoWeb.TodoApiView do
  use TodoWeb, :view
  alias TodoWeb.TodoApiView

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, TodoApiView, "todo_api.json")}
  end

  def render("show.json", %{todo_api: todo_api}) do
    %{data: render_one(todo_api, TodoApiView, "todo_api.json")}
  end

  def render("todo_api.json", %{todo_api: todo_api}) do
    %{id: todo_api.id,
      text: todo_api.text,
      status: todo_api.status}
  end
end
