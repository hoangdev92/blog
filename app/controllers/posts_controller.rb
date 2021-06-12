class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update]

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      flash[:success] = 'ok'
      redirect_to new_posts_path
    else
      flash[:error] = 'co loi'
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = 'ok'
    else
      flash[:error] = 'co loi'
    end
    render :edit
  end

  private

  def set_post
    @post = current_user.posts.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :description)
  end
end
