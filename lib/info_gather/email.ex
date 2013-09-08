defmodule InfoGather.Email do

  def send_notify_email() do
    username = System.get_env("SENDGRID_USERNAME")
    password = System.get_env("SENDGRID_PASSWORD")

    if username && password do
      to = "ses.directory@gmail.com"
      from = "ses.directory@gmail.com"

      :gen_smtp_client.send({to, [from],
        "Subject: new registration\r\nFrom: SES Directory \r\nTo: SES Maintainer \r\n\r\nA user has submitted information."},
          [{:relay, "smtp.sendgrid.net"}, {:username, username}, {:password, password}])
    end
  end

end

