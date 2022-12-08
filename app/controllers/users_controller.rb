class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def new
    @users = User.new
  end

  def create
  @user = User.new(user_params)

  if @user.save
    flash[:notice] = "ユーザーを新規登録しました"
  end
end

  def edit
    @users = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "ユーザーIDが#{@users.id}の情報を更新しました"
      redirect_to :users_index
    else
      render"new"
    end
  end

    

  def account
    @user = current_user
  end

  private
  def user_params
  params.require(:user).permit(:image_id, :name, :introduction)
  end
end
