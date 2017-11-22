class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
    @users = User.all.reject { |i| i.name == current_user.name }.map { |i| [i.name, i.id] }
  end

  def create
    receive_user = User.find(params[:message].fetch(:receive_name, false))
    tmp = message_parameter
    if current_user.messages.create(body: tmp.fetch(:body), user_id: current_user.id, receive_name: tmp.fetch(:receive_name))
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  def destroy
  end

  private

  def message_parameter
    params.require(:message).permit(:receive_name, :body)
  end
end
