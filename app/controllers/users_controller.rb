class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

end


private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end