class UsersController < ApplicationController
  def show
     @user = User.find_by(username: params[:username])
     @tweets = @user.tweets
     @tweetings = Tweet.where(user: current_user.all_following)
     #@user = User.avatar
  end

  def create
    @user = User.where(id: current_user.id)
    #@user.avatar = params[:user][:avatar]
    #@user.status = params[:user][:status]
    #@user.save
  end
  
# PATCH/PUT originally taken from tweets_conroller
  def update
    @user = User.where(id: current_user.id)
  
  #@user.edit_user(:avatar, params[:user][:avatar])
  #@user = User.find(params[:id])
  #THIS IS SHOWING ERROR BELOW - Errno::EACCES in UsersController#update  Permission denied @ dir_s_mkdir - /users
  #EACCESS error means that process cannot write to that location. This requires that the user has permission to change the directory permission. 
  #If the user does not, you may have to sign in with a user with more privileges.
  #You don't have permission to write to [[/Users/Development]]

    if @user.update(user_params)
      redirect_to tweets_path(@user), notice: 'Status was successfully updated.'
    else
      render :edit
    end
  end


#this 2 sections needs to be sorted out: if I blank out avatar then it works for status only, if I un-hash avatar it breaks
  def edit
    @user = User.find_by(username: params[:username])
    #@user.status = params[:username]
    #@user.avatar = params[:username]
    @user.save
    
    #@user = @user.avatar
    #@user = @user.status
    #@user = current_user.status.new 
    #@user.avatar = params[:username]
    
  end
  
private

# Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:status, :avatar)
  end
end
