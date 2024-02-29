class RenameTbaleCreateRequestToRequest < ActiveRecord::Migration[7.1]
  def change
    rename_table :create_requests, :requests
  end
end
