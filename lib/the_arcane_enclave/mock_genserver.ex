defmodule TheArcaneEnclave.MockGenserver do
  use GenServer

  # Public API
  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def staged_responses(pid) do
    GenServer.cast(__MODULE__, {:start_stages, pid})
  end

  # GenServer Callbacks
  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_cast({:start_stages, pid}, state) do
    # Simulate staged responses
    send_stage_responses(pid, 1)
    {:noreply, state}
  end

  # Private helper function
  defp send_stage_responses(pid, 1) do
    Process.send_after(self(), {:send_response, pid, "Stage 1 Complete"}, 1000)
  end

  defp send_stage_responses(pid, 2) do
    Process.send_after(self(), {:send_response, pid, "Stage 2 Complete"}, 2000)
  end

  defp send_stage_responses(pid, 3) do
    Process.send_after(self(), {:send_response, pid, "All Stages Complete"}, 3000)
  end

  @impl true
  def handle_info({:send_response, pid, message}, state) do
    send(pid, {:genserver_response, message})

    # Continue to the next stage if possible
    case message do
      "Stage 1 Complete" -> send_stage_responses(pid, 2)
      "Stage 2 Complete" -> send_stage_responses(pid, 3)
      _ -> :ok
    end

    {:noreply, state}
  end
end
