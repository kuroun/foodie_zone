class Api::ApiController < RocketPants::Base

  protected

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, option|
      @user = User.find_by(auth_token: token)
    end
  end

  def render_forbidden
    error! :forbidden
  end

  def render_unauthorized
    error! :unauthenticated
  end
end
