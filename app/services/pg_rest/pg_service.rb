module PgRest
  class PgService < ActiveRecord::Migration[6.0]

    attr_accessor :uri

    def initialize
    end 

    def self.create_table(table_name:)
      self.with_transaction do  
        PgService.create_table table_name.to_sym do |t|
          t.timestamps
        end
      end 
    end 

    def self.drop_table(table_name:)
      self.with_transaction do  
        PgService.drop_table table_name.to_sym
      end 
    end 

    def self.add_column(table_name:, field:, type:, foreign_key: false, null: true, array: false)
      self.with_transaction do  
        PgService.add_column table_name.to_sym, field.to_sym, type.to_sym, null: null, default: default, array: array, foreign_key: foreign_key 
      end
    end 

    def self.remove_column(table_name:, field:, type:)
      self.with_transaction do  
        PgService.remove_column table_name.to_sym, field.to_sym, type.to_sym
      end 
    end 

    def self.with_transaction
      ActiveRecord::Base.transaction do 
        yield 
      end        
    end 

  end 
end 