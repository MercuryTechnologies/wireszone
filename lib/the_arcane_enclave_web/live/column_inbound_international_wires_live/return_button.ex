defmodule TheArcaneEnclaveWeb.ColumnInboundInternationalWiresLive.ReturnButton do
  use TheArcaneEnclaveWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.button
        phx-click="return-wire"
        phx-target={@myself}
        phx-value-wire-id={@id}
      >
        Return This Wire
      </.button>
    </div>
    """
  end

  @impl true
  def update(assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
    }
  end

  @impl true
  @spec handle_event(<<_::88>>, any(), any()) :: {:noreply, any()}
  def handle_event("return-wire", _params, socket) do
    Finch.build(:post, "http://localhost:3000/wires-zone/request-return")
    |> Finch.request(TheArcaneEnclave.Finch)
    |> IO.inspect
    {:noreply, socket}
  end
end
