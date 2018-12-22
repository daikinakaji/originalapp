class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def show
    @user = User.find(params[:id])
    @blogs = Blog.where(user_id: session[:user_id])
  end


  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to @user,success:"ようこそzyukenへ"
    else
      flash.now[:danger] = "登録に失敗しました"
      render:new

    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user) ,success:"プロフィールを変更しました"
    else
      flash.now[:danger] = "変更に失敗しました"
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
