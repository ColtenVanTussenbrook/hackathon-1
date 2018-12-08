class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = @post.comments
  end

  def show
  end

  def new 
    @comment = @post.comments.new
    render partial: "form"
  end

  def create 
    @comment = @post.comments(comment_params)
    if @comment.save
      redirect_to posts_path
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
    redirect_to comments_path
  end

  private 
    def set_post 
      @post = Post.find(params[:id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params 
      params.require(:comment).permit(:body)
    end
end
