class PostVotesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])

    @post_vote = PostVote.new(post_vote_params)
    authorize @post
    @post_vote.user = current_user
    @post_vote.post = @post
    if @post_vote.save!
      redirect_to post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_vote_params
    params.require(:post_vote).permit(:upvote)
  end
end
