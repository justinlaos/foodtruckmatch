defmodule Foodtruckmatch.Service.NetworkCall do
  import HTTPoison.Response

  def get_request(url) do
    {:ok, response} = HTTPoison.get(url)
    Jason.decode!(response.body)
  end
end
