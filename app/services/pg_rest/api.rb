require 'rest-client'

module PgRest 
  class Api 

    attr_accessor :api_url, :api_token

    def initialize(api_url:, api_token: PgRest.api_token)
      @api_url = api_url 
      @api_token = api_token       
    end 

    def find_table(table_name:)      
      url = "#{@api_url}/tables/#{table_name}"          
      resp = RestClient.get(url, headers)      
      result = handle_response(resp)
    end 

    def create_table(table_name:)      
      url = "#{@api_url}/tables"    
      params = {
        name: table_name
      }.to_json
      resp = RestClient.post(url, params, headers)      
      result = handle_response(resp)
    end 

    def drop_table(table_name:)      
      url = "#{@api_url}/tables/#{table_name}"    
      resp = RestClient.delete(url, headers)      
      result = handle_response(resp)
    end 

    def add_column(
        table_name:,
        name:,
        type:,
        default: nil,
        array: false,
        primary_key: false,
        foreign_key: false
      )      
      url = "#{@api_url}/tables/#{table_name}/columns"          
      params = {
        column: {
          name: name, 
          type: type,
          default: default,
          array: array,
          primary_key: primary_key,
          foreign_key: foreign_key
        }
      }.to_json
      resp = RestClient.post(url, params, headers)      
      result = handle_response(resp)
    end 

    def remove_column(table_name:,name:)
      url = "#{@api_url}/tables/#{table_name}/columns/#{name}"    
      resp = RestClient.delete(url, headers)      
      result = handle_response(resp)
    end

    def schema 
      url = "#{@api_url}/schema"    
      resp = RestClient.get(url, headers)
      result = handle_response(resp)        
    end 

    def headers 
      {
        "Content-Type": "application/json",
        "Authorization": "Bearer #{@api_token}"
      }
    end 

    def handle_response(resp)
      JSON.parse(resp)
    end

  end
end 