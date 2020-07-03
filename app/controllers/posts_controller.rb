class PostsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
  end
end

def show
  @post = Post.find(params[:id])
end

  private
  def post_params
    params.require(:post).permit(:title, :description, :descriptions, :descriptionstwo, images: [])
  end
end
