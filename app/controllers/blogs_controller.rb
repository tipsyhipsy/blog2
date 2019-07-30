class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new

    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def creat
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      flash[:notice] = '投稿しました！'
      redirect_to blogs_path
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice:'削除しました。'
  end

  private

  def blog_params
    params.require(:blog).permit(:title,:content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
