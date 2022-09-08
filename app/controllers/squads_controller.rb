class SquadsController < ApplicationController
  def index
    @squads = policy_scope(Squad)
  end

  def show
    @squad = Squad.find(params[:id])
    @squad_message = SquadMessage.new()
    @membership = Membership.where(user:current_user, squad: @squad)[0]
    authorize @squad
  end

  def new
    @squad = Squad.new();
    authorize @squad
  end

  def create
    chatroom = Chatroom.create()
    @squad = Squad.new(squad_params)
    @squad.chatroom = chatroom
    watchlist = Watchlist.create()
    @squad.watchlist = watchlist
    @squad.user = current_user
    @squad.save
    watchlist.squad = @squad
    chatroom.squad = @squad
    chatroom.save
    watchlist.save
    authorize @squad
    Membership.create(user:current_user, squad: @squad)
    @squad.watchlist = watchlist
    @squad.save
    redirect_to squad_path(@squad)
  end

  def destroy
  end

  def join
  end

  def addToWatchlist
    @squad = Squad.find(params[:squad_id])
    a = params.permit(:crypto)
    a = a["crypto"].to_i
    Watching.create!(watchlist: @squad.watchlist, crypto: Crypto.find(a))
    authorize @squad
    redirect_to squad_path(@squad)
  end

  private
  def squad_params
    params.require(:squad).permit(:description, :title)
  end

end
