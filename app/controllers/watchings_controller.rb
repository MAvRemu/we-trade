class WatchingsController < ApplicationController
  def destroy
    @watching = Watching.find(params[:id])
    @watching.destroy!
  end

end
