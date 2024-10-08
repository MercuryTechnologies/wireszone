defmodule TheArcaneEnclaveWeb.AuthController do
  use TheArcaneEnclaveWeb, :controller

  def callback_phase(%{ assigns: %{ ueberauth_failure: fails } } = conn, _params) do
    # do things with the failure
  end

  def callback_phase(%{ assigns: %{ ueberauth_auth: auth } } = conn, params) do
    # do things with the auth
  end
end
