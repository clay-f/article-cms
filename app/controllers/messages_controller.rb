class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
    @users = User.all.reject { |i| i.name == current_user.name }.map { |i| [i.name, i.id] }
  end

  def create
  end

  def show
  end

  def destroy
  end
end
