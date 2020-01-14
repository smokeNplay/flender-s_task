class MessagesController < ApplicationController
  def index
    @filterrific = initialize_filterrific(
      Message,
      params[:filterrific],
      select_options: { sorted_by: Message.options_for_sorted_by },
      available_filters: [:sorted_by, :by_email, :by_last_name]
    ) || return
    @messages = @filterrific.find.page(params[:page])

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    message = Message.create(message_params)
    return head :created if message.persisted?

    render json: { errors: message.errors }, status: :bad_request
  end

  def message_params
    params.fetch(:message, {}).permit(:email, :first_name, :last_name, :amount)
  end
end
