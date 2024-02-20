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

    {:ok,
    socket
    |> assign(:users, users)}
  end

  def handle_params(params, uri, socket) do
    {:noreply,
      socket
      |> apply_action(socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :index, params) do
    socket
  end

  defp apply_action(socket, :user, %{"user_id" => user_id}) do
    %{username: username} = Enum.find(socket.assigns.users, &(&1.id == user_id))
    UsagePubSub.subscribe(username)

    socket
    |> stream(:usage, [])
  end

  defp handle_info({:current_usage, payload}, socket) do
    {:noreply,
      socket
      |> stream_insert(:usage, payload)}
  end
end
