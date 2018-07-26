defmodule Req do

  def l8sleeping() do
    local_base
    |> put_in([:repo, :repo_name], "8_sleeping")
  end

  def l2basic() do
    local_base
    |> put_in([:repo, :repo_name], "2_basic")
  end

  defp local_base() do
    %{:service => :LOCAL,
      :repo => %{owner: "psr", branch_name: "master", commit_sha: UUID.uuid1},
      :auth => %{client_id: "predrag", client_secret: "client_secret", access_token: "access_token"},
      :project_id => "project_id",
      :request_token => UUID.uuid1,
      :hook_id => UUID.uuid1,
      :branch_id => UUID.uuid1
  }
  end

end
