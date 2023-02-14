defmodule RealDealApiWeb.Auth.SetAccount do
  import Plug.Conn
  alias ElixirSense.Plugin
  alias RealDealApiWeb.Auth.ErrorResponse
  alias RealDealApi.Accounts

  def init(_options) do

  end

  def call(conn, _options) do
    if conn.assigns[:account] do
      conn

    else
      account_id = get_session(conn, :account_id)
      if account_id == nil, do: ErrorResponse.Unauthorized

      case Accounts.get_account!(account_id) do
        account -> assign(conn, :account, account)
        nil -> assign(conn, :account, nil)
      end
    end
  end
end
