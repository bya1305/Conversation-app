class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    if @message.save
      redirect_to :back
    end
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end
end
