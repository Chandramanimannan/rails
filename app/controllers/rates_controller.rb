class RatesController < ApplicationController
    def create
    ratelist = Rate.new(rates_params)

    if ratelist.save

      render json: {ratelist: ratelist, message: 'Ratelist created' }, status: :created
    else
      render json: { errors: ratelist.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    # Fetch a specific entity based on e_name
    entity = Rate.find_by(company_name: params[:company_name])
    render json: entity
  end

  private

  def rates_params
    params.permit(:company_name, :settlement_scheme, :MDR, :txn_app, :txn_dec, :txn_total, :RR,:settlement_fee)
  end
end
