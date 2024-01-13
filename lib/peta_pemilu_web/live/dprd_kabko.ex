defmodule PetaPemiluWeb.Live.DprdKabko do
  use PetaPemiluWeb, :live_view
  require Jason

  def render(assigns) do
    ~H"""
    <div>
      <pre>
      <%= Jason.encode!(assigns.candidates, pretty: true) %>
      </pre>
    </div>
    """
  end

  def mount(%{"slug" => slug}, _session, socket) do
    candidates = PetaPemilu.Candidate.caleg_by_dapil(:dprd_kabko, slug)

    {:ok, assign(socket, :candidates, candidates)}
  end
end
