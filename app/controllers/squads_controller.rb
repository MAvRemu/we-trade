class SquadsController < ApplicationController
  def index
    @squads = policy_scope(Squad)

  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  def join
  end

  private

end
