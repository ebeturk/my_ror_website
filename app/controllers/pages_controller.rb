class PagesController < ApplicationController
  #Black-list approach for the time being :) All are welcome
  skip_before_action :authenticate_user!

  def home
  end

  def profile
    
  end
end
