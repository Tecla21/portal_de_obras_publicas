class DashboardController < ApplicationController
  before_action :authenticate_user!, only: [:home, :edit, :update]
  def home
  end
  def index
    if user_signed_in?
      redirect_to dashboard_home_path and return
    end
  end
end
