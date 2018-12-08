class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = current_user.posts.comments
  end

  def show
  end

  def new 
    @comment = Comment.new
    # render partial: "form"
  end

  def create 
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = params[:post_id]
    if @comment.save!
      redirect_to post_path(@post)
    else  
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update 
    if @comment.update(comment_params)
      redirect_to comments_path
    else 
      render :edit
    end
  end

  def destroy 
    @comment.destroy 
    redirect_to post_path(@post)
  end

  private 
    def set_post 
      @post = Post.find(params[:post_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params 
      params.require(:comment).permit(:body)
    end
end
