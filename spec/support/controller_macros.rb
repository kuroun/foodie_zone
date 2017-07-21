module ControllerMacros
  def login_user
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      User.create(name: 'Admin test', type: 'Admin', email: 'admin_test1@gmail.com',:password => '123456', :password_confirmation => '123456')
      user = User.first
      sign_in user
    end
  end
end
