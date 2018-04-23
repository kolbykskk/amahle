class CallbacksController < Devise::OmniauthCallbacksController
    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])
    end
end
