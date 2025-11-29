defmodule LiquidityWeb.LiquidityCard do
  use Phoenix.Component

  def liquidity_card(assigns) do
    ~H"""
    <div class="liquidity-card">
      <h3><%= @title %></h3>
      <p class="value"><%= @value %></p>
      <p class="change"><%= @change %></p>
    </div>
    """
  end
end
