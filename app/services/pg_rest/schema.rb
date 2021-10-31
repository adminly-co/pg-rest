module PgRest
  module Schema 

    attr_accessor :tables 

    def self.table_names
      #ActiveRecord::Base.connection.query_cache.clear
      @tables = ActiveRecord::Base.connection.tables
    end 

    def self.table_schema(table_name) 
      @tables = table_names 
      pg_table = PgRest::PgTable.modelize(table_name) 
      pg_table.reset_column_information      
      columns = []
      pg_table.columns.each do |column|
        columns << render_column(column) 
      end 
      columns
    end 

    def self.pg_schema 
      @tables = table_names
      schema = {
        tables: @tables
      }
      @tables.each do |table_name|
        schema[table_name] = table_schema(table_name)
      end      
      schema   
    end 

    def self.render_column(column)
      {
        name: column.name,
        type: column.sql_type_metadata.type,
        limit: column.sql_type_metadata.limit,
        precision: column.sql_type_metadata.precision,
      }
    end 
    
  end 
end 
