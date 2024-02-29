class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :address, :string
    add_column :users, :contactNo, :integer
    add_column :users, :dateOfJoining, :integer
  end
end
