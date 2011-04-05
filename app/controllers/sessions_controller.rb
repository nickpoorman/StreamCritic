class SessionsController < ApplicationController
  def new
    respond_to do |format|
      format.html { render :layout => false }
      format.js
    end
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      respond_to do |format|
        format.html { render :action => 'new' }
        format.js { render :action => "create_failure"}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end
