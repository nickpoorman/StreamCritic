class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def new
    @user = User.new
    respond_to do |format|
      format.html { render :layout => false }
      format.js
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.js
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end
end
