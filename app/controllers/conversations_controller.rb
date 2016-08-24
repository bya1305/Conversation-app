class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.user_id = current_user.id
    @conversation.save
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render 'new'
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy
    redirect_to root_path
  end



  private

    def conversation_params
      params.require(:conversation).permit(:title, :category)
    end
end
