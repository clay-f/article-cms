class MessagesController < ApplicationController
  rescue_from NoMethodError, with: :handle_no_method_error
  def index
    @messages = Message.where(receive_name: current_user.id).select("distinct on (user_id) *")
    uniq_val = @messages.map { |i| i.receive_name }.uniq
  end

  def new
    @message = Message.new
    @users = User.all.reject { |i| i.name == current_user.name }.map { |i| [i.name, i.id] }
  end

  def create
    receive_user = User.find((params[:message].fetch(:receive_name, false)))
    tmp = message_parameter
    if current_user.messages.create(body: tmp.fetch(:body), user_id: current_user.id, message_state_id: 2)
      ActionCable.server.broadcast 'messages',
        username: receive_user.name,
        message: params[:message].fetch(:body)
      head :ok
    else
      render "new"
    end
  end

  def show
    @message = Message.find(params[:id])
    @messages_list = Message.where("receive_name = #{current_user.id}").order(:created_at)

    if @message.message_state_id == 2
      @message.message_state_id = 1 
      @message.save
    end
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

  def handle_no_method_error
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end
end
