defmodule Liquidity.ReportFormatter do
  @moduledoc """
  Formats liquidity reports for various outputs
  """

  def format_weekly_report(liquidity_data, interpretation) do
    """
    Weekly Liquidity Report
    =======================
    
    Net Liquidity: #{format_currency(liquidity_data.net_liquidity)}
    Fed Balance Sheet: #{format_currency(liquidity_data.fed_balance)}
    TGA Balance: #{format_currency(liquidity_data.tga_balance)}
    RRP Balance: #{format_currency(liquidity_data.rrp_balance)}
    
    Analysis: #{interpretation.summary}
    Signal: #{interpretation.signal}
    """
  end

  defp format_currency(amount) when is_number(amount) do
    "$#{Float.round(amount / 1_000_000_000, 2)}B"
  end
  defp format_currency(_), do: "N/A"
end
