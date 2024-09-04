class ApiRequest < ApplicationRecord
  belongs_to :api_key, optional: true
  belongs_to :user, optional: true
  serialize :request_details, coder: JSON, type: Object
end
