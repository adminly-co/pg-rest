module PgRest
  class PgService

    attr_accessor :uri

    def initialize
    end 

    def self.create_table(table_name:)
      self.with_transaction do  
        ActiveRecord::Migration[6.0].create_table table_name.to_sym do |t|
          t.timestamps
        end
      end 
    end 

    def self.drop_table(table_name:)
      self.with_transaction do  
        ActiveRecord::Migration[6.0].drop_table table_name.to_sym
      end 
    end 

    def self.add_column(
        table_name:, 
        name:, 
        type:, 
        primary_key: false,
        foreign_key: false, 
        null: true, 
        default: nil, 
        array: false
      )
      self.with_transaction do  
        ActiveRecord::Migration[6.0].add_column(
          table_name.to_sym, 
          name.to_sym, 
          type.to_sym, 
          null: true, 
          default: default, 
          array: array, 
          primary_key: primary_key,
          foreign_key: foreign_key 
        )
      end
    end 

    def self.remove_column(table_name:, name:)
      self.with_transaction do  
        ActiveRecord::Migration[6.0].remove_column table_name.to_sym, name.to_sym
      end 
    end 

    def self.with_transaction
      ActiveRecord::Base.transaction do 
        yield 
      end        
    end 

  end 
end 