defmodule Plc do
  alias InternalApi.Plumber.PipelineService.Stub, as: PplStub
  alias InternalApi.Plumber.ScheduleRequest
  alias InternalApi.Plumber.VersionRequest
  alias Util.Proto

  @moduledoc """
  Documentation for PlumberClient.
  """

  def connect do
    {:ok, _channel} = GRPC.Stub.connect("localhost:50053")
  end

  def version do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.version(VersionRequest.new())
  end

  def schedule(args) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.schedule(schedule_request(args))
  end

  defp schedule_request(args) do
       Proto.deep_new!(ScheduleRequest, args)
  end

end
