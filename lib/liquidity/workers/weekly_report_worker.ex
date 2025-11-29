defmodule Liquidity.Workers.WeeklyReportWorker do
  @moduledoc """
  Generates weekly liquidity reports
  """

  alias Liquidity.{NetLiquidity, Interpreter, ReportFormatter}

  def perform do
    with {:ok, liquidity_data} <- NetLiquidity.calculate() do
      interpretation = Interpreter.interpret(liquidity_data)
      report = ReportFormatter.format_weekly_report(liquidity_data, interpretation)
      
      # TODO: Send report via email/notification
      IO.puts(report)
      
      {:ok, report}
    end
  end
end
