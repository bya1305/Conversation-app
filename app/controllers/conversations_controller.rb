class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.all
  end

  def new
    @conversation = Conversation.new
  end

  def create
    @conversation = Conversation.create(conversation_params)
    if @conversation.save
      redirect_to conversation_path(@conversation)
    else
      render 'new'
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
  end



  private

    def conversation_params
      params.require(:conversation).permit(:title, :category)
    end
end
