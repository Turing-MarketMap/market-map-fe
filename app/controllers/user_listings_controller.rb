class UserListingsController < ApplicationController
  before_action :current_user

  def create
    UserListingService.create_user_listing(@current_user[:user_id], params[:listing_id])

    redirect_to "/profile"
  end

  def destroy
    UserListingService.delete_user_listing(@current_user[:user_id], params[:listing_id])

    redirect_to "/profile"
  end
end
