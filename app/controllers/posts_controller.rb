class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    authorize @post
    @comment = PostComment.new
    @post_vote = PostVote.new
    @comment_nested = PostNestedComment.new

    @post_bookmark_present = PostBookmark.exists?(user: current_user, post: @post)
    if @post_bookmark_present
      @post_bookmark = PostBookmark.find_by(user: current_user, post: @post)
    else
      @post_bookmark = PostBookmark.new
    end
  end

  def myposts
    @myposts = current_user.bookmark_posts
    authorize @myposts
    @myposts = filter_posts(@myposts)
  end

  def index
    @posts = policy_scope(Post)
    @posts = filter_posts(Post.all)
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
      redirect_to posts_path(filter: "new")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :title, :photo, :content_trix)
  end

  def filter_posts(posts)
    if params[:filter] == "new"
      @posts = posts.all.sort do |a, b|
        b.created_at <=> a.created_at
      end
    elsif params[:filter] == "comments"
      @posts = posts.all.sort do |a, b|
        b.post_comments.count <=> a.post_comments.count
      end
    elsif params[:filter] == "votes"
      @posts = posts.all.sort do |a, b|
        b.post_votes.sum {|vote| vote.upvote } <=> a.post_votes.sum {|vote| vote.upvote }
      end
    elsif params[:filter] == "hot"
      @posts = posts.all.sort do |a, b|
        if b.post_comments.last.present? && a.post_comments.last.present?
          output = b.post_comments.last.created_at <=> a.post_comments.last.created_at
        else
          output = -1
        end
        output
      end
    else
      @posts = posts
    end
  end
end
