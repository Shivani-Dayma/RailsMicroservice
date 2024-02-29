class CreateCreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :create_requests do |t|
      t.string :reason
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
