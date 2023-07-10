class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :inavlid

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private
    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def inavlid(errors)
        render json: { errors: errors }, status: 422
    end
end
