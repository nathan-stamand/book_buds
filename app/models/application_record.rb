class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def logged_in?
    !!session[:user_id]
  end

  def current_user 
    User.find_by(id: session[:user_id])
  end 

end
