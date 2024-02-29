class Demo < ActiveRecord::Migration[7.1]
  def change
    create_table :demos do |t|    
      t.string :name      
    end
  end
end
