require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "#create" do
    context "with valid params" do
      it "creates user" do
        params = {
          user: {
            email: "user@example.com",
            first_name: "John",
            last_name: "Doe",
            password: "password",
            password_confirmation: "password",
          },
        }

        post :create, params: params
        binding.pry
      end
    end
  end
end
