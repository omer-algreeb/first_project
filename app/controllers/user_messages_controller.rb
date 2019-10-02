class UserMessagesController < ApplicationController
  before_action :set_user_message, only: [:show, :update, :destroy]

  # GET /user_messages
  def index
    @user_messages = UserMessage.all

    render json: @user_messages
  end

  # GET /user_messages/1
  def show
    render json: @user_message
  end

  # POST /user_messages
  def create
    @user_message = UserMessage.new(user_message_params)

    if @user_message.save
      render json: @user_message, status: :created, location: @user_message
    else
      render json: @user_message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_messages/1
  def update
    if @user_message.update(user_message_params)
      render json: @user_message
    else
      render json: @user_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_messages/1
  def destroy
    @user_message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_message
      @user_message = UserMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_message_params
      params.require(:user_message).permit(:user_id, :message_id)
    end
end
