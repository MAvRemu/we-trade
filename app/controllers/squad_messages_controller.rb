class SquadMessagesController < ApplicationController

  def create
    @squad = Squad.find(params[:squad_id])
    @message = SquadMessage.new(message_params)
    @message.chatroom = @squad.chatroom
    @message.user = current_user
    authorize @message
    if @message.save
      #redirect_to squad_path(@squad)
      ChatroomChannel.broadcast_to(
        @squad.chatroom,
        render_to_string(partial: "message", locals: {message: @message})
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private
  def message_params
    params.require(:squad_message).permit(:content)
  end

end
