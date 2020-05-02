class UsersController < ApplicationController
  before_action :set_item, only: [:show, :signout, :payment]

  def show
  end

  def signout
  end

  def payment
  end

  private
  def set_item
    @categories = Category.all
  end
  
end