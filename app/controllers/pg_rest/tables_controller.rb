module PgRest
  class TablesController < ApplicationController 
    
    before_action :authenticate_request!
    skip_before_action :verify_authenticity_token

    def index 
      schema = PgRest::Schema.db_schema       
      render json: { data: schema }
    end 

    def show 
      table = PgRest::Schema.table_schema(params[:id])
      render json: { data: table }
    end 

    def create  
      PgService.create_table(table_name: pg_params[:name])
      render json: { message: 'Table created' }
    end 

    def destroy  
      PgService.drop_table(table_name: pg_params[:name])
      render json: { message: 'Table dropped' }
    end 

    private

    def pg_params
      params
        .require(params[:table])
        .permit(
          :name
        )
    end 

  end 
end 