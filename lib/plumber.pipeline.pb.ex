defmodule InternalApi.Plumber.ScheduleRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          service: integer,
          repo: InternalApi.Plumber.ScheduleRequest.Repo.t(),
          auth: InternalApi.Plumber.ScheduleRequest.Auth.t(),
          project_id: String.t(),
          branch_id: String.t(),
          hook_id: String.t(),
          request_token: String.t()
        }
  defstruct [:service, :repo, :auth, :project_id, :branch_id, :hook_id, :request_token]

  field :service, 2, type: InternalApi.Plumber.ScheduleRequest.ServiceType, enum: true
  field :repo, 3, type: InternalApi.Plumber.ScheduleRequest.Repo
  field :auth, 4, type: InternalApi.Plumber.ScheduleRequest.Auth
  field :project_id, 6, type: :string
  field :branch_id, 7, type: :string
  field :hook_id, 8, type: :string
  field :request_token, 9, type: :string
end

defmodule InternalApi.Plumber.ScheduleRequest.Repo do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          owner: String.t(),
          repo_name: String.t(),
          branch_name: String.t(),
          commit_sha: String.t()
        }
  defstruct [:owner, :repo_name, :branch_name, :commit_sha]

  field :owner, 1, type: :string
  field :repo_name, 2, type: :string
  field :branch_name, 4, type: :string
  field :commit_sha, 5, type: :string
end

defmodule InternalApi.Plumber.ScheduleRequest.Auth do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          client_id: String.t(),
          client_secret: String.t(),
          access_token: String.t()
        }
  defstruct [:client_id, :client_secret, :access_token]

  field :client_id, 1, type: :string
  field :client_secret, 2, type: :string
  field :access_token, 3, type: :string
end

defmodule InternalApi.Plumber.ScheduleRequest.ServiceType do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :GIT_HUB, 0
  field :LOCAL, 1
end

defmodule InternalApi.Plumber.ScheduleResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t(),
          ppl_id: String.t()
        }
  defstruct [:response_status, :ppl_id]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
  field :ppl_id, 2, type: :string
end

defmodule InternalApi.Plumber.DescribeRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ppl_id: String.t(),
          detailed: boolean
        }
  defstruct [:ppl_id, :detailed]

  field :ppl_id, 1, type: :string
  field :detailed, 2, type: :bool
end

defmodule InternalApi.Plumber.DescribeResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t(),
          pipeline: InternalApi.Plumber.Pipeline.t(),
          blocks: [InternalApi.Plumber.Block.t()]
        }
  defstruct [:response_status, :pipeline, :blocks]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
  field :pipeline, 3, type: InternalApi.Plumber.Pipeline
  field :blocks, 4, repeated: true, type: InternalApi.Plumber.Block
end

defmodule InternalApi.Plumber.Block do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          block_id: String.t(),
          name: String.t(),
          build_req_id: String.t(),
          state: integer,
          result: integer,
          result_reason: integer,
          error_description: String.t()
        }
  defstruct [:block_id, :name, :build_req_id, :state, :result, :result_reason, :error_description]

  field :block_id, 1, type: :string
  field :name, 2, type: :string
  field :build_req_id, 3, type: :string
  field :state, 4, type: InternalApi.Plumber.Block.State, enum: true
  field :result, 5, type: InternalApi.Plumber.Block.Result, enum: true
  field :result_reason, 6, type: InternalApi.Plumber.Block.ResultReason, enum: true
  field :error_description, 7, type: :string
end

defmodule InternalApi.Plumber.Block.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :WAITING, 0
  field :RUNNING, 1
  field :STOPPING, 2
  field :DONE, 3
end

defmodule InternalApi.Plumber.Block.Result do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :PASSED, 0
  field :STOPPED, 1
  field :CANCELED, 2
  field :FAILED, 3
end

defmodule InternalApi.Plumber.Block.ResultReason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :TEST, 0
  field :MALFORMED, 1
  field :STUCK, 2
  field :USER, 3
  field :INTERNAL, 4
  field :STRATEGY, 5
  field :FAST_FAILING, 6
  field :DELETED, 7
end

defmodule InternalApi.Plumber.DescribeTopologyRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ppl_id: String.t()
        }
  defstruct [:ppl_id]

  field :ppl_id, 1, type: :string
end

defmodule InternalApi.Plumber.DescribeTopologyResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: InternalApi.Plumber.ResponseStatus.t(),
          blocks: [InternalApi.Plumber.DescribeTopologyResponse.Block.t()]
        }
  defstruct [:status, :blocks]

  field :status, 1, type: InternalApi.Plumber.ResponseStatus
  field :blocks, 2, repeated: true, type: InternalApi.Plumber.DescribeTopologyResponse.Block
end

defmodule InternalApi.Plumber.DescribeTopologyResponse.Block do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          jobs: [String.t()]
        }
  defstruct [:name, :jobs]

  field :name, 1, type: :string
  field :jobs, 2, repeated: true, type: :string
end

defmodule InternalApi.Plumber.TerminateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ppl_id: String.t(),
          requester_id: String.t()
        }
  defstruct [:ppl_id, :requester_id]

  field :ppl_id, 1, type: :string
  field :requester_id, 2, type: :string
end

defmodule InternalApi.Plumber.TerminateResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t()
        }
  defstruct [:response_status]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
end

defmodule InternalApi.Plumber.ListRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          project_id: String.t(),
          branch_name: String.t(),
          page: integer,
          page_size: integer
        }
  defstruct [:project_id, :branch_name, :page, :page_size]

  field :project_id, 1, type: :string
  field :branch_name, 2, type: :string
  field :page, 3, type: :int32
  field :page_size, 4, type: :int32
end

defmodule InternalApi.Plumber.ListResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t(),
          pipelines: [InternalApi.Plumber.Pipeline.t()],
          page_number: integer,
          page_size: integer,
          total_entries: integer,
          total_pages: integer
        }
  defstruct [:response_status, :pipelines, :page_number, :page_size, :total_entries, :total_pages]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
  field :pipelines, 2, repeated: true, type: InternalApi.Plumber.Pipeline
  field :page_number, 3, type: :int32
  field :page_size, 4, type: :int32
  field :total_entries, 5, type: :int32
  field :total_pages, 6, type: :int32
end

defmodule InternalApi.Plumber.Pipeline do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ppl_id: String.t(),
          name: String.t(),
          project_id: String.t(),
          branch_name: String.t(),
          commit_sha: String.t(),
          created_at: Google.Protobuf.Timestamp.t(),
          pending_at: Google.Protobuf.Timestamp.t(),
          queuing_at: Google.Protobuf.Timestamp.t(),
          running_at: Google.Protobuf.Timestamp.t(),
          stopping_at: Google.Protobuf.Timestamp.t(),
          done_at: Google.Protobuf.Timestamp.t(),
          state: integer,
          result: integer,
          result_reason: integer,
          terminate_request: String.t(),
          hook_id: String.t(),
          branch_id: String.t(),
          error_description: String.t(),
          switch_id: String.t(),
          working_directory: String.t(),
          yaml_file_name: String.t(),
          terminated_by: String.t()
        }
  defstruct [
    :ppl_id,
    :name,
    :project_id,
    :branch_name,
    :commit_sha,
    :created_at,
    :pending_at,
    :queuing_at,
    :running_at,
    :stopping_at,
    :done_at,
    :state,
    :result,
    :result_reason,
    :terminate_request,
    :hook_id,
    :branch_id,
    :error_description,
    :switch_id,
    :working_directory,
    :yaml_file_name,
    :terminated_by
  ]

  field :ppl_id, 1, type: :string
  field :name, 2, type: :string
  field :project_id, 3, type: :string
  field :branch_name, 4, type: :string
  field :commit_sha, 5, type: :string
  field :created_at, 6, type: Google.Protobuf.Timestamp
  field :pending_at, 7, type: Google.Protobuf.Timestamp
  field :queuing_at, 8, type: Google.Protobuf.Timestamp
  field :running_at, 9, type: Google.Protobuf.Timestamp
  field :stopping_at, 10, type: Google.Protobuf.Timestamp
  field :done_at, 11, type: Google.Protobuf.Timestamp
  field :state, 12, type: InternalApi.Plumber.Pipeline.State, enum: true
  field :result, 13, type: InternalApi.Plumber.Pipeline.Result, enum: true
  field :result_reason, 14, type: InternalApi.Plumber.Pipeline.ResultReason, enum: true
  field :terminate_request, 15, type: :string
  field :hook_id, 16, type: :string
  field :branch_id, 17, type: :string
  field :error_description, 18, type: :string
  field :switch_id, 19, type: :string
  field :working_directory, 20, type: :string
  field :yaml_file_name, 21, type: :string
  field :terminated_by, 22, type: :string
end

defmodule InternalApi.Plumber.Pipeline.State do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :INITIALIZING, 0
  field :PENDING, 1
  field :QUEUING, 2
  field :RUNNING, 3
  field :STOPPING, 4
  field :DONE, 5
end

defmodule InternalApi.Plumber.Pipeline.Result do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :PASSED, 0
  field :STOPPED, 1
  field :CANCELED, 2
  field :FAILED, 3
end

defmodule InternalApi.Plumber.Pipeline.ResultReason do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :TEST, 0
  field :MALFORMED, 1
  field :STUCK, 2
  field :USER, 3
  field :INTERNAL, 4
  field :STRATEGY, 5
  field :FAST_FAILING, 6
  field :DELETED, 7
end

defmodule InternalApi.Plumber.GetProjectIdRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          ppl_id: String.t()
        }
  defstruct [:ppl_id]

  field :ppl_id, 1, type: :string
end

defmodule InternalApi.Plumber.GetProjectIdResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t(),
          project_id: String.t()
        }
  defstruct [:response_status, :project_id]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
  field :project_id, 2, type: :string
end

defmodule InternalApi.Plumber.ValidateYamlRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          yaml_definition: String.t(),
          ppl_id: String.t()
        }
  defstruct [:yaml_definition, :ppl_id]

  field :yaml_definition, 1, type: :string
  field :ppl_id, 2, type: :string
end

defmodule InternalApi.Plumber.ValidateYamlResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t(),
          ppl_id: String.t()
        }
  defstruct [:response_status, :ppl_id]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
  field :ppl_id, 2, type: :string
end

defmodule InternalApi.Plumber.ScheduleExtensionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          file_path: String.t(),
          ppl_id: String.t(),
          request_token: String.t(),
          env_variables: [InternalApi.Plumber.EnvVariable.t()],
          previous_ppl_ids: [String.t()]
        }
  defstruct [:file_path, :ppl_id, :request_token, :env_variables, :previous_ppl_ids]

  field :file_path, 1, type: :string
  field :ppl_id, 2, type: :string
  field :request_token, 3, type: :string
  field :env_variables, 4, repeated: true, type: InternalApi.Plumber.EnvVariable
  field :previous_ppl_ids, 5, repeated: true, type: :string
end

defmodule InternalApi.Plumber.EnvVariable do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          name: String.t(),
          value: String.t()
        }
  defstruct [:name, :value]

  field :name, 1, type: :string
  field :value, 2, type: :string
end

defmodule InternalApi.Plumber.ScheduleExtensionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          response_status: InternalApi.Plumber.ResponseStatus.t(),
          ppl_id: String.t()
        }
  defstruct [:response_status, :ppl_id]

  field :response_status, 1, type: InternalApi.Plumber.ResponseStatus
  field :ppl_id, 2, type: :string
end

defmodule InternalApi.Plumber.DeleteRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          project_id: String.t(),
          branch_id: String.t(),
          requester: String.t()
        }
  defstruct [:project_id, :branch_id, :requester]

  field :project_id, 1, type: :string
  field :branch_id, 2, type: :string
  field :requester, 3, type: :string
end

defmodule InternalApi.Plumber.DeleteResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          status: InternalApi.Plumber.ResponseStatus.t()
        }
  defstruct [:status]

  field :status, 1, type: InternalApi.Plumber.ResponseStatus
end

defmodule InternalApi.Plumber.VersionRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  defstruct []
end

defmodule InternalApi.Plumber.VersionResponse do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          version: String.t()
        }
  defstruct [:version]

  field :version, 1, type: :string
end

defmodule InternalApi.Plumber.ResponseStatus do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          code: integer,
          message: String.t()
        }
  defstruct [:code, :message]

  field :code, 1, type: InternalApi.Plumber.ResponseStatus.ResponseCode, enum: true
  field :message, 2, type: :string
end

defmodule InternalApi.Plumber.ResponseStatus.ResponseCode do
  @moduledoc false
  use Protobuf, enum: true, syntax: :proto3

  field :OK, 0
  field :BAD_PARAM, 1
end

defmodule InternalApi.Plumber.PipelineService.Service do
  @moduledoc false
  use GRPC.Service, name: "InternalApi.Plumber.PipelineService"

  rpc :Schedule, InternalApi.Plumber.ScheduleRequest, InternalApi.Plumber.ScheduleResponse
  rpc :Describe, InternalApi.Plumber.DescribeRequest, InternalApi.Plumber.DescribeResponse

  rpc :DescribeTopology,
      InternalApi.Plumber.DescribeTopologyRequest,
      InternalApi.Plumber.DescribeTopologyResponse

  rpc :Terminate, InternalApi.Plumber.TerminateRequest, InternalApi.Plumber.TerminateResponse
  rpc :List, InternalApi.Plumber.ListRequest, InternalApi.Plumber.ListResponse

  rpc :GetProjectId,
      InternalApi.Plumber.GetProjectIdRequest,
      InternalApi.Plumber.GetProjectIdResponse

  rpc :ValidateYaml,
      InternalApi.Plumber.ValidateYamlRequest,
      InternalApi.Plumber.ValidateYamlResponse

  rpc :ScheduleExtension,
      InternalApi.Plumber.ScheduleExtensionRequest,
      InternalApi.Plumber.ScheduleExtensionResponse

  rpc :Delete, InternalApi.Plumber.DeleteRequest, InternalApi.Plumber.DeleteResponse
  rpc :Version, InternalApi.Plumber.VersionRequest, InternalApi.Plumber.VersionResponse
end

defmodule InternalApi.Plumber.PipelineService.Stub do
  @moduledoc false
  use GRPC.Stub, service: InternalApi.Plumber.PipelineService.Service
end
