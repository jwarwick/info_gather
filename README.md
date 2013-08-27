# InfoGather

This is a project built with Elixir that uses Dynamo to serve web requests.

## Postgres Setup
This application assumes Postgres is configured properly. Launch `psql` and
enter the following:

``` sql

 CREATE USER dbuser WITH PASSWORD 'TooManySecrets';
 CREATE DATABASE infogather;
 GRANT ALL PRIVILEGES ON DATABASE infogather to dbuser;
 \connect infogather
 CREATE TABLE data (id serial PRIMARY KEY, entry varchar(2000));

```

