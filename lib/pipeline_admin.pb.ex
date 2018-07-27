defmodule InternalApi.Plumber.TerminateAllRequest do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    requester_token: String.t,
    project_id:      String.t,
    branch_name:     String.t
  }
  defstruct [:requester_token, :project_id, :branch_name]

  field :requester_token, 1, type: :string
  field :project_id, 2, type: :string
  field :branch_name, 3, type: :string
end

defmodule InternalApi.Plumber.TerminateAllResponse do
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
    response_status: InternalApi.Plumber.ResponseStatus.t
  }
  defstruct [:response_status]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
end

defmodule InternalApi.Plumber.Admin.Service do
  use GRPC.Service, name: "InternalApi.Plumber.Admin"

  rpc :TerminateAll, InternalApi.Plumber.TerminateAllRequest, InternalApi.Plumber.TerminateAllResponse
end

defmodule InternalApi.Plumber.Admin.Stub do
  use GRPC.Stub, service: InternalApi.Plumber.Admin.Service
end
