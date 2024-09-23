class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
      userpage_path  # ログイン後に userpage へリダイレクト
    end
  end
  
end
