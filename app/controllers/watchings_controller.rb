class WatchingsController < ApplicationController
  def destroy
    @watching = Watching.find(params[:id])
    squad = @watching.watchlist.squad
    authorize @watching
    @watching.destroy!
    redirect_to squad_path(squad)
  end
end
