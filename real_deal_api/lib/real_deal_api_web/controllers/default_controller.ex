defmodule RealDealApiWeb.DefaultController do
  use RealDealApiWeb, :controller

  def index(conn, _params) do
    text conn, "The Real deal API is Live - #{Mix.env()}"
  end
end
