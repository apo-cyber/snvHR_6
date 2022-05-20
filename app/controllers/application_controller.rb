class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    unless current_user
      flash[:notice] = "ログインが必要です"
      redirect_to login_path
    end
  end

  def fiscal_year
    t=Time.new
    if 1 <= t.month and t.month <=3
      return t.year-1
    else
      return t.year
    end
  end
end
