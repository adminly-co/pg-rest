# PgRest
PgRest is a REST API for managing Active Record database migrations. 

Perform Active Record database migrations to manage database schema migrations.

## Features
PgRest supports the following database migrations:
 - Add tables
 - Drop tables
 - Add columns
 - Remove columns
 - API token authorization

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'pg_rest'
```

And then execute:
```bash
$ bundle
```

Mount the PgRest API by updating your `routes.rb` file:
```
  mount PgRest::Engine, at: "/pg-rest"
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
GET /pg-rest/schema
```

You can inspect any specific table using the schema endpoint:

```
GET /pg-rest/schema/<table_name>
```

### Create a Table

Create a table migration.

```
POST /pg-rest/:table_name

Parameters

| Parameter | Type | Description |
| --- | --- |
| table_name | string | The name of the database table |


### Drop a Table

Drop a database table.

DELETE /pg-rest/:table_name

Parameters

| Parameter |Type | Description |
| --- | --- | --- |
| table_name | string | The name of the database table to drop.|

### Add Column

Add a database column.

```
POST /pg-rest/<table_name>
```

Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| table_name | string | The name of the database table.|
| name | string | The column name. |
| type | string | Active Record supported database field type.|
| default | boolean | The default value. Defaults to `null`|
| array | boolean  |The name of the database table.|
| foreign_key | boolean | Column is a foreign_key. Defaults to `false`. |
| primary_key | boolean | Column is a primary_key. Defaults to `false`. |


### Remove Column

Remove a database column.

```
POST /pg-rest/<table_name>
```

Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| table_name | string | The name of the database table.|
| name | string | The column name. |


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
https:/github.com/skillhire/pg_rest


## License

The gem is available as open source under the terms of the [MIT License](https:/opensource.org/licenses/MIT).
