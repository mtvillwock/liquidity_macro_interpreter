defmodule Liquidity.NetLiquidityTest do
  use ExUnit.Case
  alias Liquidity.NetLiquidity

  test "calculates net liquidity" do
    # This is a placeholder test
    # In production, you'd mock the DataFetcher calls
    assert {:ok, _result} = NetLiquidity.calculate()
  end
end
