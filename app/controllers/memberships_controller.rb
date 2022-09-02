class MembershipsController < ApplicationController

  def create
    @mem = Membership.new(user: current_user, squad: Squad.find(params[:squad_id]))
    authorize @mem
    @mem.save
    redirect_to squads_path
  end
  def destroy
  end

  private

end
