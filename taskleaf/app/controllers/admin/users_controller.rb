class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def confirm_new
    @user = User.new(user_params)
    render :new, status: :unprocessable_entity unless @user.valid?
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if params[:back].present?
      render :new, status: :see_other
      return
    end

    if @user.save
      UserMailer.creation_email(@user).deliver_now
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end

  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
