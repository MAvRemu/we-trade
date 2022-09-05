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
  end

  def create
    chatroom = Chatroom.create()
    @squad = Squad.new(user: current_user, title: params[:title], description: params[:description], chatroom: chatroom)
    authorize @squad
    @squad.save
    chatroom.squad = @squad
    chatroom.save
    Membership.create(user:current_user, squad: @squad)
    watchlist = Watchlist.create!(squad: @squad);
    @squad.watchlist = watchlist
    @squad.save
  end

  def destroy
  end

  def join
  end

  def addToWatchlist
    if (params[:query])
      @squad = Squad.find(params[:squad_id])
      authorize @squad
      redirect_to squads_path(@squad)
    end

  end

  private

end
