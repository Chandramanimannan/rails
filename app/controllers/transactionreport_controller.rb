class TransactionreportController < ApplicationController
    def search
        result = Transactiontable.where(your_search_params)
        render json: result
    end

    private
    def your_search_params
        params.permit(:txnid, :merchant, :MID, :paymentgateway, :currency, :country, :cardtype, :cardnumber, :Status, :fromdate, :todate)
    end
 
#     def search
#     # Extracting search parameters from request payload
#     search_params = params[:formData]

#     # Use your ActiveRecord query to find the entry based on search parameters
#     result = Transactiontable.where(search_params)

#     render json: result
#   end

end
