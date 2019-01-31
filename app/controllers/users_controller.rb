class UsersController < ApplicationController
  before_action:logged_in_user,only:[:edit,:update]
  before_action:correct_user,only:[:edit,:update,:index,:show]

  def index
     @users = if params[:search]
      User.search(params[:search])
    else
    @users = User.all
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user,success:"ようこそzyukenへ"
    else
      flash.now[:danger] = "登録に失敗しました"
      render:new

    end
  end

  def show
    @user = User.find(params[:id])
    @blogs = Blog.all
    @users = User.all
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

  

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url)unless @user == current_user
    #code
  end

  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation,:college_name,:address,:text)
  end
end
