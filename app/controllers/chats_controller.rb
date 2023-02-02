class ChatsController < ApplicationController

  def create
    sender = @user
    message = params[:message]
    receiver = User.find_by_id(params[:user_id])
    if message.blank?
      return render json: {
        message: "can not send empty message"
      }, status: :unprocessable_entity
    end
    if receiver.nil?
      return render json: {
        message: "receiver did not exist"
      }, status: :unprocessable_entity
    end

    @chat = Chat.new_message(sender, receiver, message)

    if @chat.save
      return render json: @chat.created_attribute(@user), status: :created
    else
      return render json: @chat.errors, status: :unprocessable_entity
    end
  end
end
