class UserpagesController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @projects = current_user.projects
  end
end
