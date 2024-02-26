class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.valid? && user.save

      render json: {user: user, message: 'User created' }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :mobile_no, :country, :role, :company_name, :password, :password_confirmation)
  end
end
