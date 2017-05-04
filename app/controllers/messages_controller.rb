class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
     response = Translate::TranslateApi.translate(@message.dialect, @message.message)
    @message.message = response[:message]
    if response[:error]
      flash[:danger] = response[:error]
    end
    respond_to do |format|
      if @message.save
        @publish = true
      else
        @publish = false
      end
      format.js
    end
  end


  private

    def message_params
      params.require(:message).permit(:message, :author, :dialect)
    end
end
