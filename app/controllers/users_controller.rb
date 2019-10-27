class UsersController < ApplicationController
  def show
     @user = User.find_by(username: params[:username])
     @tweets = @user.tweets
     @tweetings = Tweet.where(user: current_user.all_following)
  end

  def create
    @user = User.where(id: current_user.id)
    #@user.avatar = params[:user][:avatar]
    @user.status = params[:user][:status]
    @user.save
  end
  
# PATCH/PUT originally taken from tweets_conroller
  def update
    @user = User.where(id: current_user.id)
    if @user.update(user_params)
      redirect_to tweets_path(@users), notice: 'Status was successfully updated.'
    else
      render :edit
    end
  end


#this 2 sections needs to be sorted out: if I blank out avatar then it works for status only, if I un-hash avatar it breaks
  def edit
    @user = User.find_by(username: params[:username])
    #@user = @user.avatar
    @user.status = params[:username]
    @user.save
    
    #@user = @user.status
    #@user = current_user.status.new 
    #@user.avatar = params[:username]
    
  end

# Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:status) #, :avatar)
  end
end