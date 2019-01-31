class BlogsController < ApplicationController
  before_action:correct_user,only:[:edit,:update,:index,:show]
  def new
    @blog = Blog.new

  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to  current_user ,success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def index
    @blogs = Blog.all
    @blog = Blog.find_by(params[:id])
  end

  def destroy
    @blog = current_user.blogs.find_by(id:params[:id])
    @blog.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
    #code
  end

  

  private
  def blog_params
    params.require(:blog).permit(:title,:image,:content,:user_id)
  end
end
