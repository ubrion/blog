class PostsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find_by(slug: params[:slug])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "Post añadido correctamente."
    else
      render "new"
    end
  end

  def edit
    @post = Post.find_by(slug: params[:slug])
  end

  def update
    @post = Post.find_by(slug: params[:slug])

    if @post.update(post_params)
      redirect_to posts_path, notice: "Post actualizado correctamente."
    else
      render "edit"
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :slug, :body, :date)
  end
end
