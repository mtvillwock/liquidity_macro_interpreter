defmodule LiquidityWeb.DashboardLive do
  use Phoenix.LiveView

  alias Liquidity.{NetLiquidity, Interpreter}

  def mount(_params, _session, socket) do
    if connected?(socket) do
      :timer.send_interval(60_000, self(), :update)
    end

    {:ok, fetch_data(socket)}
  end

  def handle_info(:update, socket) do
    {:noreply, fetch_data(socket)}
  end

  defp fetch_data(socket) do
    case NetLiquidity.calculate() do
      {:ok, data} ->
        interpretation = Interpreter.interpret(data)
        
        assign(socket,
          liquidity_data: data,
          interpretation: interpretation,
          last_update: DateTime.utc_now()
        )
      
      _error ->
        assign(socket,
          liquidity_data: nil,
          interpretation: nil,
          last_update: DateTime.utc_now()
        )
    end
  end

  def render(assigns) do
    ~H"""
    <div class="dashboard">
      <h1>Liquidity Macro Dashboard</h1>
      
      <%= if @liquidity_data do %>
        <div class="metrics">
          <div class="card">
            <h3>Net Liquidity</h3>
            <p class="value"><%= format_billions(@liquidity_data.net_liquidity) %></p>
          </div>
          
          <div class="card">
            <h3>Fed Balance Sheet</h3>
            <p class="value"><%= format_billions(@liquidity_data.fed_balance) %></p>
          </div>
          
          <div class="card">
            <h3>TGA Balance</h3>
            <p class="value"><%= format_billions(@liquidity_data.tga_balance) %></p>
          </div>
          
          <div class="card">
            <h3>RRP Balance</h3>
            <p class="value"><%= format_billions(@liquidity_data.rrp_balance) %></p>
          </div>
        </div>
        
        <div class="interpretation">
          <h2>Analysis</h2>
          <p><%= @interpretation.summary %></p>
          <p>Signal: <strong><%= @interpretation.signal %></strong></p>
        </div>
      <% else %>
        <p>Loading data...</p>
      <% end %>
      
      <p class="timestamp">Last updated: <%= Calendar.strftime(@last_update, "%Y-%m-%d %H:%M:%S UTC") %></p>
    </div>
    """
  end

  defp format_billions(nil), do: "N/A"
  defp format_billions(value) when is_number(value) do
    "$#{Float.round(value / 1_000_000_000, 2)}B"
  end
end
