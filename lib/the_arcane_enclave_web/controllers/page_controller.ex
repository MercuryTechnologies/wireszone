defmodule TheArcaneEnclaveWeb.PageController do
  use TheArcaneEnclaveWeb, :controller

  def home(conn, %{"search_query" => search_query}) when search_query != "" do
    conn
    |> redirect(to: ~p"/wires-search?search_for=#{search_query}")
  end

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home)
  end
end
