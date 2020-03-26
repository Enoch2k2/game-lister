class ApplicationController < ActionController::Base

  private

    def redirect_if_not_admin
      unless current_user.admin
        flash[:notice] = "You don't have access to view this page"
        redirect_to root_path
      end
    end
end
