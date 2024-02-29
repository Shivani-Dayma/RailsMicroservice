class DropActiveStoraheBlobs < ActiveRecord::Migration[7.1]
  def up
    drop_table :demos
  end

  def down
    create_table :demos do |t|
      # Define the columns of the demos table here
      t.string :name
      # Add any other columns as needed
      t.timestamps
    end
  end
end
