module PgRest
  class ApplicationController < ActionController::Base
    
    rescue_from Exception, with: :unprocessable_entity
    rescue_from StandardError, with: :unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :unprocessable_entity
    rescue_from ActiveRecord::ActiveRecordError, with: :unprocessable_entity
  
    def authenticate_request!       
      auth_token === PgRest.api_token && !PgRest.api_token.blank?            
    end 

    private

    def auth_token
      http_token || params['token']      
    end
  
    def http_token
      if request.headers['Authorization'].present?
        request.headers['Authorization'].split(' ').last
      end
    end
  
    def unprocessable_entity(e)
      render json: { error: e }, status: :unprocessable_entity
    end

  end
end
