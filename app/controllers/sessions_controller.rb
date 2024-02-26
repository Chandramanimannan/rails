class SessionsController < ApplicationController
  def login
    user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          render json: { user_email: user.email,role: user.role, message: 'Login successful' }, status: :ok
        else
          render json: { error: 'Invalid email/password combination' }, status: :unauthorized
        end
  end
end
