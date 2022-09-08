class MembershipsController < ApplicationController

  def create
    @squad  = Squad.find(params[:squad_id])
    @mem = Membership.new(user: current_user, squad: @squad)
    authorize @mem
    @mem.save
    redirect_to squads_path
  end
  def destroy
    @membership = Membership.find(params[:id])
    @squad = @membership.squad
    #raise
    if @squad.users.count == 1
      authorize @membership
      @membership.destroy
      authorize @squad
      @squad.destroy
    elsif @squad.user == current_user
      authorize @membership
      @membership.destroy
      @squad.update(user: @squad.users.first)
    else
      authorize @membership
      @membership.destroy
    end
    redirect_to squads_path, status: :see_other
  end

  private

end
