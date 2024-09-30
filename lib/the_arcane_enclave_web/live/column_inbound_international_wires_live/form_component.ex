defmodule TheArcaneEnclaveWeb.ColumnColumnInboundInternationalWiresLive.FormComponent do
  use TheArcaneEnclaveWeb, :live_component

  alias TheArcaneEnclave.WireDetails

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage column_inbound_international_wires records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="column_inbound_international_wires-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >

        <:actions>
          <.button phx-disable-with="Saving...">Save Column inbound international wires</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{column_inbound_international_wires: column_inbound_international_wires} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(WireDetails.change_column_inbound_international_wires(column_inbound_international_wires))
     end)}
  end

  @impl true
  def handle_event("validate", %{"column_inbound_international_wires" => column_inbound_international_wires_params}, socket) do
    changeset = WireDetails.change_column_inbound_international_wires(socket.assigns.column_inbound_international_wires, column_inbound_international_wires_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"column_inbound_international_wires" => column_inbound_international_wires_params}, socket) do
    save_column_inbound_international_wires(socket, socket.assigns.action, column_inbound_international_wires_params)
  end

  defp save_column_inbound_international_wires(socket, :edit, column_inbound_international_wires_params) do
    case WireDetails.update_column_inbound_international_wires(socket.assigns.column_inbound_international_wires, column_inbound_international_wires_params) do
      {:ok, column_inbound_international_wires} ->
        notify_parent({:saved, column_inbound_international_wires})

        {:noreply,
         socket
         |> put_flash(:info, "Column inbound international wires updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_column_inbound_international_wires(socket, :new, column_inbound_international_wires_params) do
    case WireDetails.create_column_inbound_international_wires(column_inbound_international_wires_params) do
      {:ok, column_inbound_international_wires} ->
        notify_parent({:saved, column_inbound_international_wires})

        {:noreply,
         socket
         |> put_flash(:info, "Column inbound international wires created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
