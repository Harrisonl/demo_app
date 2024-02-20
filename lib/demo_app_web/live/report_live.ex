defmodule DemoAppWeb.ReportLive do
  use DemoAppWeb, :live_view

  alias DemoApp.UsagePubSub

  def mount(params, session, socket) do
    users = [
      %{
        id: "asdf-asdf-asdf",
        username: "harry@joinploy.com"
      }
    ]

    {:ok, socket
      |> assign(:users, users)}
  end

  def handle_params(params, uri, socket) do
    {:noreply, socket}
  end


end
