# PgRest
PgRest is a REST API for managing Active Record database migrations. 

Perform Active Record database migrations to manage database schema migrations.

## Features
PgRest supports the following database migrations using a REST API:
 - Add table
 - Drop table
 - Add column
 - Remove column

PgRest operations are secured using an API token.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'pg_rest'
```

And then execute:
```bash
$ bundle
```

Mount the PgRest API by updating your `config/routes.rb` file:

```
Rails.application.routes.draw do
  ...
  mount PgRest::Engine, at: "/pg-rest"
  ...
end 
```

You can also configure PgRest with an initializer by creating a file at `config/initializers/pg_rest.rb`.

```
# Place file at config/initializers/pg_rest.rb

PgRest.tap |config|
  config.api_token = ENV['PG_REST_API_TOKEN']
end 
```

## Requirements

PgRest requires Ruby on Rails and PostgreSQL, and below are recommended versions: 
 - Rails 6+ 
 - Ruby 2.7.4+
 - Active Record supported database.

## Documentation 

PgRest is designed to remotely create common database migration tasks using a REST API.

### Schema 

Your database schema is available in order to inspect available tables and column data. 

```
GET /pg-rest
```

You can inspect any specific table using the schema endpoint:

```
GET /pg-rest/tables/<table_name>
```

### Create table

Create a table migration.

```
POST /pg-rest/tables
```

Parameters

| Parameter | Type | Description |
| --- | --- |
| name | string | The name of the database table. |


### Drop table

Drop a database table.

```
DELETE /pg-rest/tables/:table_name
```

Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| table_name | string | The name of the database table to drop.|

### Add column

Add a database column.

```
POST /pg-rest/tables/<table_name>/columns
```

Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| table_name | string | The name of the table.|
| name | string | The column name. |
| type | string | Active Record supported database field type.|
| default | boolean | The default value. Defaults to `null`|
| array | boolean  |The name of the database table.|
| foreign_key | boolean | Column is a foreign_key. Defaults to `false`. |
| primary_key | boolean | Column is a primary_key. Defaults to `false`. |


### Remove column

Remove a database column.

```
POST /pg-rest/tables/<table_name>/<column_name>
```

Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| table_name | string | The name of the table.|
| column_name | string | The name of the column to remove.|


### API Token Authentication 

The PgRest API is secured using an API token. 


```
# /config/initializers/pg_rest.rb

PgRest.tap do |config|
  config.api_token = ENV['PG_REST_API_TOKEN']  
  ...
end 
```

## Contributing
Contributions are welcome by issuing a pull request at our github repository:
https:/github.com/dash-api/pg-rest


## License

The gem is available as open source under the terms of the [MIT License](https:/opensource.org/licenses/MIT).
