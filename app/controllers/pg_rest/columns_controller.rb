module PgRest
  class ColumnsController < ApplicationController 

    skip_before_action :verify_authenticity_token

    before_action :authenticate_request!

    def create   
      result = PgService.add_column(
        table_name: params[:table_id],
        name: pg_params[:name],
        type: pg_params[:type],
        default: pg_params[:default],
        array: pg_params[:array],
        primary_key: pg_params[:primary_key],
        foreign_key: pg_params[:foreign_key]
      )
      render json: { message: 'Column added.', data: result }
    end 

    def destroy  
      result = PgService.remove_column(
        table_name: params[:table_id],
        name: params[:id]
      )
      render json: { message: 'Column removed.', data: result }
    end 

    private

    def pg_params
      params
        .require(:column)
        .permit(
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