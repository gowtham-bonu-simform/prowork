class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_empty_post, only: [:new]

  def index; end

  def new; end

  def create
    @post = authorize [:admin, current_user.posts.build(post_params)]
    if @post.save
      redirect_to root_path, notice: 'successfully created a product'
    else
      flash.now[:alert] = 'post not created!'
      render :new, status: :unprocessable_entity
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, {months: []}, :experience, {hourly_rate: []}, :project_budget, :description, :skill_list)
    end

    def create_empty_post
      @post = authorize [:admin, Post.new]
    end
end 

