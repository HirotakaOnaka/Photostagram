class PostsController < ApplicationController
  before_action:set_post, only:[:show, :edit, :update, :destroy]
  before_action:login_check,only:[:new,:index,:edit,:show,:destroy]

  def index
    @posts = Post.all
  end

  def new
    if params[:back]
      @post = Post.new(post_params)
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      PostMailer.post_mail(@post).deliver
      redirect_to posts_path, notice:"Complete!"
    else
      render 'new'
    end
  end

  def confirm
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    render :new if @post.invalid?
  end

  def show
    @like = current_user.likes.find_by(post_id: @post.id)
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Edit Complete!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end