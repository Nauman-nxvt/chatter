class MessagesController < ApplicationController

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
    # @message.message = Translate::TranslateApi.translate(@message.dialect, @message.message)
     response = Translate::TranslateApi.translate(@message.dialect, @message.message)
    @message.message = response[:message]
    if response[:error]
      flash[:danger] = response[:error]
    end
    respond_to do |format|
      if @message.save
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
