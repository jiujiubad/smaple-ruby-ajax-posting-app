class PostsController < ApplicationController

  def index
    @posts = Post.order("id DESC").all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save

    redirect_to posts_path
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    # redirect_to posts_path
    # render :js => "alert('ok');"
    # destroy.js.erb
  end

  protected

  def post_params
    params.require(:post).permit(:content)
  end

end
