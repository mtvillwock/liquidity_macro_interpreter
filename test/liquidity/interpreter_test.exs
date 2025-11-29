defmodule Liquidity.InterpreterTest do
  use ExUnit.Case
  alias Liquidity.Interpreter

  test "interprets liquidity data" do
    data = %{
      net_liquidity: 5_000_000_000,
      fed_balance: 8_000_000_000,
      tga_balance: 500_000_000,
      rrp_balance: 2_500_000_000
    }

    result = Interpreter.interpret(data)
    
    assert result.trend in [:bullish, :bearish, :neutral]
    assert result.signal in [:buy, :sell, :hold]
    assert is_binary(result.summary)
  end
end
