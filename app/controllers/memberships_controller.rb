class MembershipsController < ApplicationController

  def create
    @mem = Membership.new(user: current_user, squad: params[:squad])
    authorize @mem
    @mem.save

  end

  def destroy
  end

  private

end
