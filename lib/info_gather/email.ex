defmodule InfoGather.Email do

  def send_notify_email() do
    username = System.get_env("SENDGRID_USERNAME")
    password = System.get_env("SENDGRID_PASSWORD")
    to = System.get_env("NOTIFY_EMAIL_TO")
    from = System.get_env("NOTIFY_EMAIL_FROM")

    if username && password && to && from do
      :gen_smtp_client.send({to, [from],
        "Subject: new registration\r\nFrom: Directory Server <#{from}> \r\nTo: Directory Maintainer <#{to}> \r\n\r\nA user has submitted information."},
          [{:relay, "smtp.sendgrid.net"}, {:port, 587}, {:username, username}, {:password, password}])
    end
  end

end

