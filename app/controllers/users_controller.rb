class UsersController < ApplicationController
  def show
     @user = User.find_by(username: params[:username])
     @tweets = @user.tweets
     @tweetings = Tweet.where(user: current_user.all_following)
  end

  def create
    @user = User.where(id: current_user.id)
    #@user.save
  end
  
  def update
    @user = User.where(id: current_user.id)

  #BELOW IS SHOWING Errno::EACCES when running locally- don't have permission to write to eg /Users/Development

    if @user.update(user_params)
      redirect_to tweets_path(@user), notice: 'Status was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @user = User.find_by(username: params[:username])
    @user.save
  end
  
private

# Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:status, :avatar)
  end
end
