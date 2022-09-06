class PostVotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    authorize @post
    @post_vote = PostVote.find_by(user: current_user, post_id: params[:post_id])
    if @post_vote.present?
      @post_vote.update!(upvote: params[:upvote])
      redirect_to post_path(@post)
    else
      @post_vote = PostVote.new(upvote: params[:upvote])
      @post_vote.user = current_user
      @post_vote.post = @post
      if @post_vote.save!
        redirect_to post_path(@post)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  private

  def post_vote_params
    params.require(:post_vote).permit(:upvote)
  end
end
