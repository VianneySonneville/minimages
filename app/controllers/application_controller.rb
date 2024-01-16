class ApplicationController < ActionController::Base
  def index
    redirect_to minimages_path    
  end
end
