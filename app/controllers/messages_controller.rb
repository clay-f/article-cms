class MessagesController < ApplicationController
  def index
    @messages = Message.where(receive_name: current_user.id.to_s)
    puts "use messages size: #{@messages.size}"
    render "index"
  end

  def new
    @message = Message.new
    @users = User.all.reject { |i| i.name == current_user.name }.map { |i| [i.name, i.id] }
  end

  def create
    receive_user = User.find(params[:message].fetch(:receive_name, false))
    tmp = message_parameter
    if current_user.messages.create(body: tmp.fetch(:body), user_id: current_user.id, receive_name: tmp.fetch(:receive_name), message_state_id: 2)
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    message = Message.find(params[:id])
    message.message_state_id = 1
    message.save
  end

  def destroy
    message = Message.find(params[:id])
    if message.destroy
      redirect_to user_messages_path
    end
  end

  private

  def message_parameter
    params.require(:message).permit(:receive_name, :body)
  end
end
