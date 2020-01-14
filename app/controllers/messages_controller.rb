class MessagesController < ApplicationController
  def index; end

  def create
    message = Message.create(message_params)
    return head :created if message.persisted?

    render json: { errors: message.errors }, status: :bad_request
  end

  def message_params
    params.fetch(:message, {}).permit(:email, :first_name, :last_name, :amount)
  end
end
