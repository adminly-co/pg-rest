module PgRest
  class SchemaController < ApplicationController 
    
    before_action :authenticate_request!

    def index 
      tables = PgRest::Schema.table_names 
      render json: { data: tables }
    end 
    
  end 
end 