class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      create_session(@user)
      flash[:notice] = "Welcome, #{@user.name}!"
      render :show
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end 

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
  end

end
