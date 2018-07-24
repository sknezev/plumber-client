defmodule PlumberClient do
  @moduledoc """
  Documentation for PlumberClient.
  """

  @doc """
  Hello world.

  ## Examples

      iex> PlumberClient.hello
      :world

  """
  def version do
    {:ok, channel} = GRPC.Stub.connect("localhost:50053")
    {:ok, _reply} = channel |> InternalApi.Plumber.PipelineService.Stub.version(InternalApi.Plumber.VersionRequest.new())
  end
end
