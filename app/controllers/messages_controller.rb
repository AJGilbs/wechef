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
  end

  def new
     @message = Message.new
  end

  def create
    @request = Request.find(params[:request_id])
    @message = Message.new(message_params)
    @message.request = @request

  end

end
