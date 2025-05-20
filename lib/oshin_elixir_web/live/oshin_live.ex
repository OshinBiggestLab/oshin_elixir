defmodule OshinElixirWeb.OshinLive do
  use OshinElixirWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :quote, %{quote: "-", speaker: "-"})}
  end

  @spec render(any()) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <h1>DISPLAY WORDS</h1>
    <br/>
    <p>Quote: <%= @quote.quote %></p>
    <p>Speaker:  <%= @quote.speaker %></p>
    <br/>
    <div id="blab" phx-hook="Blab">
    <button class="random-btn" phx-click="randm_quote">Click Here</button>
    </div>
    """
  end

  defp random_quote() do
    quotes = [
      %{quote: "The only way to do great work is to love what you do.", speaker: "Steve Jobs"},
      %{quote: "Believe in yourself, and everything will be possible.", speaker: "Eliezer Yudkowsky"},
      %{quote: "Happiness is not something ready-made. It comes from your own actions.", speaker: "Dalai Lama"},
    ]

    Enum.random(quotes)
  end

  def handle_event("random_quote", _unsigned_params, socket) do
    randomized_quote = random_quote()
    {:noreply, assign(socket, quote: randomized_quote)}
  end
end
