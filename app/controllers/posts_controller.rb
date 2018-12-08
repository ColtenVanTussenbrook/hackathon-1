class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @posts = current_user.posts
  end

  def show
  end

  def edit
  end

  private 
    def set_post 
      @posts = current_user.posts.find(params[:id])
    end
end
