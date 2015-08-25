# InfoGather

This is a project built with Elixir that uses Dynamo to serve web requests and Ecto 
to interface with Postgres.

To setup:
* `mix deps.get`
* `mix db.create`
* `mix db.seed`
* `mix server` to start the webserver

## Postgres Setup
This application assumes Postgres is configured properly. 
You must have either `DATABASE_URL` (Heroku style) defined to reference the database to
use or have a local postgres install with the current user having privleges on the database `infogather`.

``` sql

 CREATE DATABASE infogather;

```

To connect to a Heroku database of a deployed application, use `heroku pg:psql --app <app-name>`

There is a mix helper defined to create the required tables. Run `mix db.create`.

## Postgres Commands
Some postgres commands that are useful
  * `psql <dbname>` to connect to the database
  * `\dt` list tables
  * `\q` to close the connection

Useful sql
```

  SELECT * FROM BUS;
  INSERT INTO bus (name) VALUES ('A New bus');
  INSERT INTO classroom (grade_level, name) VALUES (1, 'First Grade, Teacher C');
  UPDATE bus SET name = '--None--' WHERE id = 1;
  DELETE FROM data; -- deletes all rows from table
  DELETE FROM bus WHERE id = 22; -- delete an individual row
  DROP TABLE bus; -- delete the table

 ```
## Environment Variables
Define the following environment variables to enable certain features
  * `SENDGRID_USERNAME` and `SENDGRID_PASSWORD`: to send email using the Heroku SendGrid Addon
  * `NOTIFY_EMAIL_TO` and `NOTIFY_EMAIL_FROM`: also need to be defined to use the SendGrid Addon
  * `SUPPORT_EMAIL`: if defined, adds a line of help text with a `mailto` link in to the top of the page



