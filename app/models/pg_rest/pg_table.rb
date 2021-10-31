module PgRest 
  class PgTable < ApplicationRecord   
    include PgSearch::Model 
    
    self.abstract_class = true    

    def self.modelize(table_name) 
      class_name = table_name.singularize.capitalize
      if Object.const_defined? class_name
        class_name.constantize
      else 
        Object.const_set class_name, Class.new(PgRest::PgTable)
      end 
    end 

  end
end