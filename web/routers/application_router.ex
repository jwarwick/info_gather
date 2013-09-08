defmodule ApplicationRouter do
  use Dynamo.Router

  import Ecto.Query

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
    query = from(c in InfoGather.ClassroomModel, order_by: c.grade_level, select: {c.id, c.name})
    classrooms = InfoGather.Repo.all(query)
    conn = conn.assign(:classrooms, classrooms)

    query = from(b in InfoGather.BusModel, order_by: b.name, select: {b.id, b.name})
    buses = InfoGather.Repo.all(query)
    conn = conn.assign(:buses, buses)

    conn = conn.assign(:support_email, System.get_env("SUPPORT_EMAIL"))

    render conn, "index.html"
  end

  get "/thanks" do
    render conn, "thanks.html"
  end

  post "/data" do
    {{y, mon, d}, {h, min, s}} = :calendar.local_time
    datetime = Ecto.DateTime[year: y, month: mon, day: d, hour: h, min: min, sec: s]
    record = InfoGather.DataModel.new(entry: URI.encode_query(conn.params), created: datetime)
    InfoGather.Repo.create record

    InfoGather.Email.send_notify_email()

    redirect conn, to: "/thanks"
  end

end
