class TypeMessagesController < ApplicationController
  before_action :set_type_message, only: [:show, :update, :destroy]

  # GET /type_messages
  def index
    @type_messages = TypeMessage.all

    render json: @type_messages
  end

  # GET /type_messages/1
  def show
    render json: @type_message
  end

  # POST /type_messages
  def create
    @type_message = TypeMessage.new(type_message_params)

    if @type_message.save
      render json: @type_message, status: :created, location: @type_message
    else
      render json: @type_message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /type_messages/1
  def update
    if @type_message.update(type_message_params)
      render json: @type_message
    else
      render json: @type_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /type_messages/1
  def destroy
    @type_message.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_message
      @type_message = TypeMessage.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def type_message_params
      params.require(:type_message).permit(:name)
    end
end
