class HomeController < ApplicationController
  skip_before_action :login_required

  def top
  end

  def portal
    @fiscal_year=fiscal_year.to_s
  end

end
