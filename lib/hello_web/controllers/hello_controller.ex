defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, "show.html", messenger: messenger)
    # text(conn, "From messenger #{messenger}")
    # json(conn, %{id: messenger})
    # send_resp(conn, 201, "")
  end
end
