module SessionsHelper
  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out(user)
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token cookies[:remember_token]
  end

  def signed_in?
    # Marcel note: If the @ prefix is used, then the field is accessed, if no @ isused, then
    #              you're effectively calling a method, for which Ruby has a convention in the case of
    #              a property setter
    !current_user.nil?
  end
end