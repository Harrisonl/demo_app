defmodule DemoAppWeb.UsageWebhookController do
  use DemoAppWeb, :controller

  alias DemoApp.UsagePubSub

  @usage %{
    user: "harry@joinploy.com",
    domain: "chatgpt.com",
    timestamp: NaiveDateTime.utc_now()
  }

  def webhook(conn, params) do
    UsagePubSub.broadcast(@usage.user, @usage)

    conn
    |> send_resp(200, "All good")
  end
end
