class MessagesController < ApplicationController


  def index
    @request = Request.find(params[:request_id])
    @messages = @request.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    else
      @over_ten = false
    end
    @messages = policy_scope(Message)
  end

  def new
     @request = Request.find(params[:request_id])
     @message = Message.new
     authorize(@message)
  end

  def create
    @message = Message.new(message_params)
    authorize(@message)
    if @message.save
      render 'index'
    else
      render "new"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :author_id)
  end
end
