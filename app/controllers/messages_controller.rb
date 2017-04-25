class MessagesController < ApplicationController
  before_action :auth

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        # format.html { redirect_to index }
        format.js
      else
        format.html { redirect_to index }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:message, :author, :dialect)
    end
end
