class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show, :profile]

  def show
    @user = User.find(params[:id])
    @bike = Bike.where(user_id: @user.id)
    authorize @user
    # if current_user !=@user
    #   redirect_to root_url

    # end
  end
end
