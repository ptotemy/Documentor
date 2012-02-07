class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if resource.admin
      admin_path
    elsif resource.documentor
      documentor_path
    else
      user_path
    end

  end
end
