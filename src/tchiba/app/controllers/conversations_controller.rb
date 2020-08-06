class ConversationsController < ApplicationController
  before_action :authenticate
  
  def index
    @coversations = Conversation.where(to_user_id: current_user.id)
  end

  def show
  end

  def new
  end

  def create
  end

  def add
  end

  def destroy
  end

private

  def set_conversation
  end
end
