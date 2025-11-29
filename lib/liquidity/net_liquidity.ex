defmodule Liquidity.NetLiquidity do
  @moduledoc """
  Calculates net liquidity: Fed Balance Sheet - TGA - RRP
  """

  alias Liquidity.DataFetcher

  def calculate do
    with {:ok, fed_data} <- DataFetcher.fetch_fed_balance_sheet(),
         {:ok, tga_data} <- DataFetcher.fetch_treasury_data(),
         {:ok, rrp_data} <- DataFetcher.fetch_reverse_repo() do
      net_liquidity = fed_data.total_assets - tga_data.tga_balance - rrp_data.rrp_balance
      
      {:ok, %{
        net_liquidity: net_liquidity,
        fed_balance: fed_data.total_assets,
        tga_balance: tga_data.tga_balance,
        rrp_balance: rrp_data.rrp_balance,
        timestamp: DateTime.utc_now()
      }}
    end
  end
end
