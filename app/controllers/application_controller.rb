class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    user_path(current_user.id) #usersコントローラのshowページcurrent_userのidを渡してジャンプ
  end



  protected

  def configure_permitted_parameters
    # サインアップ・ログイン時にemailの値も受け取れるように
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

end
