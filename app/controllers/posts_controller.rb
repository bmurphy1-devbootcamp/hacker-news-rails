class PostsController <ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params[:post].permit(:title, :url, :text))
    post.save
    redirect_to post
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(params[:post].permit(:title, :url, :text))
    redirect_to post
  end

  def destroy
    Post.destroy(params[:id])
    redirect_to root_path
  end
end
