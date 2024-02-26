class TransactiontablesController < ApplicationController
    def add_row
        row = Transactiontable.new(table_params)
        if row.save
            render json: {row: row, message: 'Data created' }, status: :created
        else
            render json: { errors: row.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        page = params.fetch(:page, 1).to_i
        per_page = params.fetch(:per_page, 10).to_i

        start_index = (page - 1) * per_page
        end_index = start_index + per_page - 1

        data = Transactiontable.all[start_index..end_index]

        render json: data
    end
    private

    def table_params
        params.permit(:txnid, :paymentgateway, :merchantTxnId, :merchant, :orderNo, :MID, :cname, :email, :cardnumber, :cardtype, :country,  :amount, :currency, :Status, :message, :pdate, :router, :webURL)
    end
end
