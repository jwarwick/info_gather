defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    # Pick which parts of the request you want to fetch
    # You can comment the line below if you don't need
    # any of them or move them to a forwarded router
    conn = conn.fetch([:params])
    conn.assign(:layout, "layout")
  end

  # It is common to break your Dynamo in many
  # routers forwarding the requests between them
  # forward "/posts", to: PostsRouter

  get "/" do
    render conn, "index.html"
  end

  get "/thanks" do
    render conn, "thanks.html"
  end

  post "/data" do
    record = InfoGather.DataEntity.new(entry: URI.encode_query(conn.params))
    InfoGather.Repo.create record

    redirect conn, to: "/thanks"
  end

end
