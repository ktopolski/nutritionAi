require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :controller do
  describe "#create" do
    context "with valid params" do
      it "creates user with profile" do
        params = {
          user: {
            email: "user@example.com",
            first_name: "John",
            last_name: "Doe",
            password: "password",
            password_confirmation: "password",
          },
          profile: {
            sex: "male",
            calorie_spread_ratio: 0.2,
            fat_ratio: 0.2,
            protein_ratio: 2.0,
            activity_level: 1,
          },
        }

        post :create, params: params, as: :json

        expect(response.code).to eql("200")
        expect(User.count).to be(1)
        expect(Profile.count).to be(1)
      end
    end

    context "with invalid user params" do
      it "returns validation errors and does not create user and profile" do
        params = {
          user: {
            email: "invalid",
            first_name: "John",
            last_name: "Doe",
            password: "pass",
            password_confirmation: "pass",
          },
          profile: {
            sex: "male",
            calorie_spread_ratio: 0.2,
            fat_ratio: 0.2,
            protein_ratio: 2.0,
            activity_level: 1,
          },
        }

        post :create, params: params, as: :json

        expect(response.code).to eql("422")
        expect(User.count).to be(0)
        expect(Profile.count).to be(0)
      end
    end

    context "with invalid profile params" do
      it "returns validation errors and does not create user and profile" do
        params = {
          user: {
            email: "test@example.com",
            first_name: "John",
            last_name: "Doe",
            password: "password",
            password_confirmation: "password",
          },
          profile: {
            sex: "male",
            calorie_spread_ratio: 2,
            fat_ratio: 0.2,
            protein_ratio: 2.0,
            activity_level: 1,
          },
        }

        post :create, params: params, as: :json

        expect(response.code).to eql("422")
        expect(User.count).to be(0)
        expect(Profile.count).to be(0)
      end
    end
  end
end
