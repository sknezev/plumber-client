defmodule Plc do
  alias InternalApi.Plumber.PipelineService.Stub, as: PplStub
  alias InternalApi.Plumber.ScheduleRequest
  alias InternalApi.Plumber.VersionRequest
  alias Util.Proto
  alias InternalApi.Plumber.DescribeRequest
  alias InternalApi.Plumber.TerminateRequest
  alias InternalApi.Plumber.GetProjectIdRequest
  alias InternalApi.Plumber.DescribeTopologyRequest
  alias InternalApi.Plumber.ValidateYamlRequest
  alias InternalApi.Plumber.ListRequest
  alias InternalApi.Plumber.TerminateAllRequest
  alias InternalApi.Plumber.Admin.Stub, as: PaStub

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

  def describe_topology(arg) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.describe_topology(DescribeTopologyRequest.new(ppl_id: arg))
  end

  def validate_yaml(yaml_def, ppl_id) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.validate_yaml(ValidateYamlRequest.new(yaml_definition: yaml_def, ppl_id: ppl_id))
  end

  def list(project_id, branch_name, page, page_size) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PplStub.list(ListRequest.new(project_id: project_id, branch_name: branch_name, page: page, page_size: page_size))
  end


  def terminate_all(req_token, project_id, branch_name) do
    {:ok, channel} = connect()
    {:ok, _reply} = channel |> PaStub.terminate_all(TerminateAllRequest.new(requester_token: req_token, project_id: project_id, branch_name: branch_name))
  end

end
