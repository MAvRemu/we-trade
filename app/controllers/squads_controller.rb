class SquadsController < ApplicationController
  def index
    @squads = policy_scope(Squad)

  end

  def show
    @squad = Squad.find_by_id(params[:id])
    @squad_message = SquadMessage.new()
    authorize @squad
  end

  def new
  end

  def create
    chatroom = Chatroom.create()
    @squad = Squad.new(user: current_user, title: params[:title], description: params[:description], chatroom: chatroom)
    authroize @squad
    save @squad
    chatroom.squad = @squad
    chatroom.save
    Membership.create(user:current_user, squad: @squad)
  end

  def destroy
  end

  def join
  end

  private

end
