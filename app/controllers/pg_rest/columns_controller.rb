module PgRest
  class TablesController < ApplicationController 

    before_action :authenticate_request!
    skip_before_action :verify_authenticity_token

    def create   
      PgService.create_column(pg_params)
    end 

    def destroy  
      PgService.remove_column(
        table_name: pg_params[:table_name],
        name: pg_params[:name]
      )
    end 

    private

    def pg_params
      params
        .require(:column)
        .permit(
          :table_name,
          :name,
          :type,
          :default,
          :array,
          :foreign_key,
          :primary_key
        )
    end 

  end 
end 