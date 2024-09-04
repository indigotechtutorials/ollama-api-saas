class AddAiResponseToApiRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :api_requests, :ai_response, :text
  end
end
