defmodule Plc do
  alias InternalApi.Plumber.PipelineService.Stub, as: PplStub
  alias InternalApi.Plumber.ScheduleRequest
  alias InternalApi.Plumber.VersionRequest
  alias Util.Proto
  alias InternalApi.Plumber.DescribeRequest
  alias InternalApi.Plumber.TerminateRequest
  alias InternalApi.Plumber.GetProjectIdRequest

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

  def describe(arg) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.describe(DescribeRequest.new(ppl_id: arg))
  end

  def terminate(arg) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.terminate(TerminateRequest.new(ppl_id: arg, requester_id: "Plc"))
  end

  def get_project_id(arg) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.get_project_id(GetProjectIdRequest.new(ppl_id: arg))
  end
end
