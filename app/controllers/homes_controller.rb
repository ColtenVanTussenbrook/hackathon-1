class HomesController < ApplicationController
  def index
    @homes = Home.all 
  end

  def show
  end

  def about
  end
end
