class AddTypeToApiRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :api_requests, :type, :string
  end
end
