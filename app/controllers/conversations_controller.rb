class ConversationsController < ApplicationController
  before_action :authenticate_someone!

  skip_after_action :verify_policy_scoped

  def index
    if current_restaurant
      @conversations = Conversation.where(restaurant: current_restaurant)
    elsif current_chef
      @conversations = Conversation.where(chef: current_chef)
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    authorize @conversation
    @message = Message.new
  end
end
