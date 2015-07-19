class Admin::PostsController < Admin::ApplicationController
  def new
    @page_title = "Add Post"
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created"
      redirect_to admin_posts_path
    else
      render "new"
    end
  end

  def edit
    @post = Post.find_by(params[:id])
  end

  def update
    @post = Post.find_by(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to admin_posts_path
    else
      render "new"
    end
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post.destroy
    flash[:danger] = "Post deleted"
    redirect_to admin_posts_path
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :user_id, :tags, :image,
                                 :body)
  end
end
