defmodule Foodtruckmatch.Workers.DailyLocationWorker do
  use Oban.Worker
  @impl Oban.Worker

  def perform(_job) do
    Foodtruckmatch.get_daily_locations()
    :ok
  end
end
