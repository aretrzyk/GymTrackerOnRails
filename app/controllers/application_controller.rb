class ApplicationController < ActionController::Base
  include Clearance::Controller

  private

  def after_sign_in_path
    redirect_to workouts_url
  end
  def after_sign_up_path
    redirect_to workouts_url
  end
end
