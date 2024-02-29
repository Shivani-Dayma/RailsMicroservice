class RenameColumnInUserFile < ActiveRecord::Migration[7.1]
  def change
    rename_column :user_files, :name, :document
  end
end
