defmodule TheArcaneEnclave.WireDetailsTest do
  use TheArcaneEnclave.DataCase

  alias TheArcaneEnclave.WireDetails

  describe "column_inbound_international_wires" do
    alias TheArcaneEnclave.WireDetails.ColumnInboundInternationalWires

    import TheArcaneEnclave.WireDetailsFixtures

    @invalid_attrs %{}

    test "list_column_inbound_international_wires/0 returns all column_inbound_international_wires" do
      column_inbound_international_wires = column_inbound_international_wires_fixture()
      assert WireDetails.list_column_inbound_international_wires() == [column_inbound_international_wires]
    end

    test "get_column_inbound_international_wires!/1 returns the column_inbound_international_wires with given id" do
      column_inbound_international_wires = column_inbound_international_wires_fixture()
      assert WireDetails.get_column_inbound_international_wires!(column_inbound_international_wires.id) == column_inbound_international_wires
    end

    test "create_column_inbound_international_wires/1 with valid data creates a column_inbound_international_wires" do
      valid_attrs = %{}

      assert {:ok, %ColumnInboundInternationalWires{} = column_inbound_international_wires} = WireDetails.create_column_inbound_international_wires(valid_attrs)
    end

    test "create_column_inbound_international_wires/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WireDetails.create_column_inbound_international_wires(@invalid_attrs)
    end

    test "update_column_inbound_international_wires/2 with valid data updates the column_inbound_international_wires" do
      column_inbound_international_wires = column_inbound_international_wires_fixture()
      update_attrs = %{}

      assert {:ok, %ColumnInboundInternationalWires{} = column_inbound_international_wires} = WireDetails.update_column_inbound_international_wires(column_inbound_international_wires, update_attrs)
    end

    test "update_column_inbound_international_wires/2 with invalid data returns error changeset" do
      column_inbound_international_wires = column_inbound_international_wires_fixture()
      assert {:error, %Ecto.Changeset{}} = WireDetails.update_column_inbound_international_wires(column_inbound_international_wires, @invalid_attrs)
      assert column_inbound_international_wires == WireDetails.get_column_inbound_international_wires!(column_inbound_international_wires.id)
    end

    test "delete_column_inbound_international_wires/1 deletes the column_inbound_international_wires" do
      column_inbound_international_wires = column_inbound_international_wires_fixture()
      assert {:ok, %ColumnInboundInternationalWires{}} = WireDetails.delete_column_inbound_international_wires(column_inbound_international_wires)
      assert_raise Ecto.NoResultsError, fn -> WireDetails.get_column_inbound_international_wires!(column_inbound_international_wires.id) end
    end

    test "change_column_inbound_international_wires/1 returns a column_inbound_international_wires changeset" do
      column_inbound_international_wires = column_inbound_international_wires_fixture()
      assert %Ecto.Changeset{} = WireDetails.change_column_inbound_international_wires(column_inbound_international_wires)
    end
  end
end
