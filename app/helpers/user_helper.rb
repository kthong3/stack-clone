module UserHelper
  def logged_in?
    session[:user_id]
  end
end

helpers UserHelper
