class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    @posts = current_user.posts
  end

  def post_hot
    @posts = Post.where(view: :desc)
  end

  def post_new
    @posts = Post.where(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    if @post.nil?
      flash[:error] = 'không tìm thấy bài viết, vui lòng kiểm tra lại'
      redirect_to root_path
    end

  end

  def new
    @post = Post.new
  end

  def create
    post = current_user.posts.new(post_params)
    if post.save
      flash[:success] = 'ok'
      redirect_to new_post_path
    else
      flash[:error] = 'co loi'
      render :new
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = 'ok'
    else
      flash[:error] = 'co loi'
    end
    redirect_to posts_path
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
    params.require(:post).permit(:name, :image_title ,:description)
  end
end
