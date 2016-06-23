class UsersController < ApplicationController
  def profile
    @user = User.find(params[:id])
  end
end
