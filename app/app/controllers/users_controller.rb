class UsersController < ApplicationController
  before_action :verify_user, only: [:edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @favorites = @user.favorites
  end

  def edit

  end

  def update

  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def verify_user
      redirect_to root_path unless current_user.id == params[:id]
    end
end
