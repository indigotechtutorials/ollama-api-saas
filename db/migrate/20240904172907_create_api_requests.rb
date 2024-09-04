class CreateApiRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :api_requests do |t|
      t.text :request_data
      t.belongs_to :api_key, null: true, foreign_key: true

      t.timestamps
    end
  end
end
