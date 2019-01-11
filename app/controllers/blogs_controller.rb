class BlogsController < ApplicationController
  def new
    @blog = Blog.new
    @user = User.find(session[:user_id])
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to blogs_path ,success: '投稿に成功しました'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new
    end
  end

  def index
    @blogs = Blog.all
    @user = User.find(session[:user_id])
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
