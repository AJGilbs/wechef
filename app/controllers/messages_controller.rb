class MessagesController < ApplicationController


  def index
    @request = policy_scope(Request).find(params[:request_id])
    @messages = @request.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    else
      @over_ten = false
    end
  end

  def new
     @request = Request.find(params[:request_id])
     @message = Message.new
     authorize(@message)
  end

  def create
    @request = Request.find(params[:request_id])
    @message = @request.messages.new(message_params)
    @message.author = current_chef || current_restaurant
    authorize(@message)
    if @message.save
      render 'dashboard'
    else
      render "new"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
