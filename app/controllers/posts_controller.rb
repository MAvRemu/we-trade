class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    authorize @post
    @comment = PostComment.new
    @post_vote = PostVote.new

  end

  def index
    @posts = policy_scope(Post)
    if params[:filter] == "new"
      @posts = Post.all.sort do |a, b|
        b.created_at <=> a.created_at
      end
    elsif params[:filter] == "comments"
      @posts = Post.all.sort do |a, b|
        b.post_comments.count <=> a.post_comments.count
      end
    elsif params[:filter] == "votes"
      @posts = Post.all.sort do |a, b|
        b.post_votes.sum {|vote| vote.upvote } <=> a.post_votes.sum {|vote| vote.upvote }
      end
    elsif params[:filter] == "hot"
      @posts = Post.all.sort do |a, b|
        if b.post_comments.last.present? && a.post_comments.last.present?
          output = b.post_comments.last.created_at <=> a.post_comments.last.created_at
        else
          output = -1
        end
        output
      end
    else
      @posts = Post.all
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def upvote
  end

  def downvote
  end

  def new
    @post = Post.new
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save!
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :photo, :content_trix)
  end

end
