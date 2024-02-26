class ClientsController < ApplicationController
  def create
    client = Client.new(client_params)

    if client.save

      render json: {client: client, message: 'Client created' }, status: :created
    else
      render json: { errors: client.errors.full_messages }, status: :unprocessable_entity
    end
  end

   def index
    # Fetch all entities from the database
    entities = Client.all
    render json: entities
  end

  private

  def client_params
    params.permit(:company_name, :company_type, :website_url, :company_email, :city, :acquirer_name, :last_settled_date)
  end
end
