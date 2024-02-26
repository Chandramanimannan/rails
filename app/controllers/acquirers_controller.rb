class AcquirersController < ApplicationController
  def create
    acquirer = Acquirer.new(acquirer_params)

    if acquirer.save

      render json: {acquirer: acquirer, message: 'Acquirer created' }, status: :created
    else
      render json: { errors: acquirer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def acquirer_params
    params.permit(:acquirer_name, :website_url, :acquirer_email, :city)
  end
end
