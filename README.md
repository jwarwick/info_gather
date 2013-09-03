# InfoGather

This is a project built with Elixir that uses Dynamo to serve web requests and Ecto 
to interface with Postgres.

To setup:
* `mix deps.get`
* `mix db.create`
* Seed the `classroom` and `bus` tables with data
* `mix server` to start the webserver

## Postgres Setup
This application assumes Postgres is configured properly. 
You must have either `DATABASE_URL` (Heroku style) defined to reference the database to
use or have a local postgres install with the current user having privleges on the database `infogather`.

``` sql

 CREATE DATABASE infogather;

```

There is a mix helper defined to create the required tables. Run `mix db.create`.


