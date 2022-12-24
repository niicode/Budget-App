class UsersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    redirect_to new_user_registration_path
  end
end
