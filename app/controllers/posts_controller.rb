class PostsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    posts = Post.all

    if !current_user
      posts = posts.where(draft: false)
    end

    @posts = posts.order(date: :desc)
  end

  def show
    @post = Post.includes(:tags).find_by(slug: params[:slug])

    if @post.draft? && !current_user
      redirect_to root_path
    end
  end

  def new
    @post = Post.new
    @tags = Tag.all
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
    @tags = Tag.all
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
    params.require(:post).permit(:body, :date, :draft, :slug, :title, tag_ids: [])
  end
end
