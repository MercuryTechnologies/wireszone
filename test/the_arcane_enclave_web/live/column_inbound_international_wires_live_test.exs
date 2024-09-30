defmodule TheArcaneEnclaveWeb.ColumnColumnInboundInternationalWiresLiveTest do
  use TheArcaneEnclaveWeb.ConnCase

  import Phoenix.LiveViewTest
  import TheArcaneEnclave.WireDetailsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  defp create_column_inbound_international_wires(_) do
    column_inbound_international_wires = column_inbound_international_wires_fixture()
    %{column_inbound_international_wires: column_inbound_international_wires}
  end

  describe "Index" do
    setup [:create_column_inbound_international_wires]

    test "lists all column_inbound_international_wires", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, ~p"/column_inbound_international_wires")

      assert html =~ "Listing Column inbound international wires"
    end

    test "saves new column_inbound_international_wires", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/column_inbound_international_wires")

      assert index_live |> element("a", "New Column inbound international wires") |> render_click() =~
               "New Column inbound international wires"

      assert_patch(index_live, ~p"/column_inbound_international_wires/new")

      assert index_live
             |> form("#column_inbound_international_wires-form", column_inbound_international_wires: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#column_inbound_international_wires-form", column_inbound_international_wires: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/column_inbound_international_wires")

      html = render(index_live)
      assert html =~ "Column inbound international wires created successfully"
    end

    test "updates column_inbound_international_wires in listing", %{conn: conn, column_inbound_international_wires: column_inbound_international_wires} do
      {:ok, index_live, _html} = live(conn, ~p"/column_inbound_international_wires")

      assert index_live |> element("#column_inbound_international_wires-#{column_inbound_international_wires.id} a", "Edit") |> render_click() =~
               "Edit Column inbound international wires"

      assert_patch(index_live, ~p"/column_inbound_international_wires/#{column_inbound_international_wires}/edit")

      assert index_live
             |> form("#column_inbound_international_wires-form", column_inbound_international_wires: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#column_inbound_international_wires-form", column_inbound_international_wires: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/column_inbound_international_wires")

      html = render(index_live)
      assert html =~ "Column inbound international wires updated successfully"
    end

    test "deletes column_inbound_international_wires in listing", %{conn: conn, column_inbound_international_wires: column_inbound_international_wires} do
      {:ok, index_live, _html} = live(conn, ~p"/column_inbound_international_wires")

      assert index_live |> element("#column_inbound_international_wires-#{column_inbound_international_wires.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#column_inbound_international_wires-#{column_inbound_international_wires.id}")
    end
  end

  describe "Show" do
    setup [:create_column_inbound_international_wires]

    test "displays column_inbound_international_wires", %{conn: conn, column_inbound_international_wires: column_inbound_international_wires} do
      {:ok, _show_live, html} = live(conn, ~p"/column_inbound_international_wires/#{column_inbound_international_wires}")

      assert html =~ "Show Column inbound international wires"
    end

    test "updates column_inbound_international_wires within modal", %{conn: conn, column_inbound_international_wires: column_inbound_international_wires} do
      {:ok, show_live, _html} = live(conn, ~p"/column_inbound_international_wires/#{column_inbound_international_wires}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Column inbound international wires"

      assert_patch(show_live, ~p"/column_inbound_international_wires/#{column_inbound_international_wires}/show/edit")

      assert show_live
             |> form("#column_inbound_international_wires-form", column_inbound_international_wires: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#column_inbound_international_wires-form", column_inbound_international_wires: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/column_inbound_international_wires/#{column_inbound_international_wires}")

      html = render(show_live)
      assert html =~ "Column inbound international wires updated successfully"
    end
  end
end
