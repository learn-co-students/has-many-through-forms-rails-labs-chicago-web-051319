class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @users = @post.users.pluck(:user_id, :username).uniq
    @comment = Comment.new
    @all_users = User.all
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    post = Post.create(post_params)
    redirect_to post_path(post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
