module Api
  module V1
    class UsersController < BaseController
      before_action :authenticate_user, except: [:create]

      def create
        @sign_up_form = SignUpForm.new(user_params)
        @sign_up_form.save
        @sign_up_form
      end

      private

      def user_params
        params.require(:user).permit(
          :email, :password, :password_confirmation, :first_name, :last_name
        )
      end
    end
  end
end
