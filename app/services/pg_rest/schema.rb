module PgRest
  module Schema 

    EXCLUDED_TABLES = []

    attr_accessor :tables 

    def self.table_names
      @tables = ActiveRecord::Base.connection.tables
      @tables.filter!{|t| !EXCLUDED_TABLES.include?(t)}.sort!
    end 

    def self.table_schema(table_name) 
      @tables = table_names 
      pg_table = PgRest.modelize(table_name)       
      pg_table.columns
    end 

    def self.db_schema 
      @tables = table_names
      schema = {
        tables: @tables
      }
      @tables.each do |table_name|
        schema[table_name] = table_schema(table_name)
      end      
      schema   
    end 
    
  end 
end 
