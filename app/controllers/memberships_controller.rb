class MembershipsController < ApplicationController

  def create
    @mem = Membership.new(user: current_user, squad: Squad.find(params[:squad_id]))
    authorize @mem
    @mem.save
    redirect_to squads_path
  end
  def destroy
    @membership = Membership.find(params[:id])
    authorize @membership
    @membership.destroy
    redirect_to squads_path, status: :see_other
  end

  private

end
