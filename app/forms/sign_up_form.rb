class SignUpForm
  include ActiveModel::Model
  attr_accessor :email, :first_name, :last_name, :password,
                :password_confirmation

  def save
    if valid?
      user.save!
    end
  end

  def user
    @user ||= User.new(user_params)
  end

  private

  def user_params
    {
      email: email, first_name: first_name, last_name: last_name,
      password: password, password_confirmation: password_confirmation
    }
  end
end
