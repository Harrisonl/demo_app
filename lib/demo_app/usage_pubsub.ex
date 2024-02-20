defmodule DemoApp.UsagePubSub do
  alias DemoApp.PubSub

  def subscribe(username), do: Phoenix.PubSub.subscribe(PubSub, topic(username))
  def broadcast(username, payload), do: Phoenix.PubSub.broadcast(PubSub, topic(username), {:current_usage, payload})

  defp topic(username), do: "usage:#{username}"
end
