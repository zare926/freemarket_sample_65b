class UsersController < ApplicationController
  before_action :set_item, only: [:show, :signout, :payment]

  def show
    @user = User.find(params[:id])
  end

  private
  def set_item
    @categories = Category.all
  end
end