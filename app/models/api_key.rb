class ApiKey < ApplicationRecord
  belongs_to :user
  has_many :api_requests
end
