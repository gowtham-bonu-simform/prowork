class Admin::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @post = authorize [:admin, Post.new]
  end

  def create
    @post = Post.new
    debugger
  end

  # def params_accept
  #   params.require(:post).permit()
end 

