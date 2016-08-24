class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build(message_params)
    @message.user = current_user
    if @message.save
      redirect_to @conversation
    end
  end

  def destroy
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages
    @message = @messages.find(params[:id])
    @message.destroy
    redirect_to @conversation
  end

  private

    def message_params
      params.require(:message).permit(:content, :user_id)
    end
end
