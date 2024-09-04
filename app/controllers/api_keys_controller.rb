class ApiKeysController < ApplicationController
  def create
    @api_key = current_user.api_keys.create(token: SecureRandom.hex(16))
    render turbo_stream: turbo_stream.append("api-keys", partial: "dashboard/api_key", locals: { api_key: @api_key })
  end
end