class BlogsController < ApplicationController
  before_action :set_blog, only:[:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(content_params)
    else
      @blog = Blog.new
    end
  end

  def confirm
    @blog = Blog.new(content_params)
    render :new if @blog.invalid?
  end

  def creat
    @blog = Blog.new(content_params)
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
    if @blog.update(content_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private

  def content_params
    params.require(:blog).permit(:content)
  end

  def set_blog
    @blog = blog.find(params[:id])
  end
end
