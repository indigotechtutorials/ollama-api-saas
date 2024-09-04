class Api::V1::ChatMessagesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authorize_request
  def create
    if params[:prompt].nil? || params[:prompt].empty?
      return render json: { message: "You must pass a prompt value with content" }, status: 400
    end

    client = Ollama.new(
      credentials: { address: 'http://localhost:11434' },
      options: { server_sent_events: true }
    )

    result = client.generate(
      { model: 'llama3.1',
        prompt:  params[:prompt] }
    )

    ai_response = result.map { |r| r['response'] }.join
    request_details = request.params.except(:controller, :action)
    request_details["original_url"] = request.original_url
    ChatMessagesApiRequest.create(api_key: @api_key, ai_response: ai_response, user: @api_key.user, request_details: request_details)
    render json: { results: ai_response }, status: 200
  end

  private

  def authorize_request
    @api_key = ApiKey.where(token: params[:token]).first
    if !@api_key
      render json: { message: "You must pass a token paremeter with a valid api key. If you need to generate an api key visit our website http://localhost:3000" }, status: 400
    end
  end
end