class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def index
    @posts = current_user.posts
  end

  def home
    @all_posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
    render partial: "form"
  end

  def create 
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    render partial: "form"
  end

  def update 
    if @post.update(post_params)
      redirect_to posts_path
    else 
      render :edit
    end
  end

  def destroy  
    @post.destroy 
    redirect_to posts_path
  end

  private 
    def set_post 
      @post = current_user.posts.find(params[:id])
    end

    def post_params 
      params.require(:post).permit(:body)
    end
end
