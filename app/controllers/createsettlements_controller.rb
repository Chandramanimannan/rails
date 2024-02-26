require 'date'

class CreatesettlementsController < ApplicationController
    def index
      fromDate = params.fetch(:fromDate)
      toDate = params.fetch(:toDate)
      company_name = params.fetch(:company_name)
    
      fromDate = fromDate + " " + "00:00:00"
      toDate = toDate + " " + "23:59:59"
      
      result = Transactiontable.where(merchant: company_name, transactiondate: fromDate..toDate)
      entity = Client.find_by(company_name: company_name)

      success_result = Transactiontable.where(merchant: company_name, transactiondate: fromDate..toDate, Status: "Success")
      total_volume = success_result.sum(:amount)
    
      rates = Rate.find_by(company_name: company_name)

      if entity
        if rates.settlement_scheme == "Total"
          result = Transactiontable.where(merchant: company_name, transactiondate: fromDate..toDate)
    
          no_of_txn = result.count
          
          val = total_volume - (total_volume * (rates.MDR / 100)) - (no_of_txn * rates.txn_total) - (total_volume * (rates.RR / 100))
    
          s_val = val * (rates.settlement_fee / 100)
    
          settlement_amount = val - s_val
    
        else 
          success_result = Transactiontable.where(merchant: company_name, transactiondate: fromDate..toDate, Status: "Success")
          failure_result = Transactiontable.where(merchant: company_name, transactiondate: fromDate..toDate, Status: "Failure")
    
          success_txn = success_result.count
          failure_txn = failure_result.count
    
          val = total_volume -  (total_volume * (rates.MDR / 100)) - ((success_txn * rates.txn_app) + (failure_txn * rates.txn_dec)) - (total_volume * (rates.RR / 100)) 
    
          s_val = val * (rates.settlement_fee / 100)
    
          settlement_amount = val - s_val
        end
    
        # Create a new instance of SettlementRecord with sno assigned
        settlement_record = Settlement.new(
          company_name: company_name,
          date_settled: Date.today,
          total_volume: total_volume,
          settlement_volume: settlement_amount,
        )
    
        if settlement_record.save
          render json: { success: true, settlement_record: settlement_record }
        else
          render json: { errors: settlement_record.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { errors: ["Client not found for company_name: #{company_name}"] }, status: :unprocessable_entity
      end
    end
   
    def show
      company_name = params.fetch(:company_name)
      record = Settlement.where(company_name: company_name).order(date_settled: :desc)
      if record.any?
        render json: record
      else
        render json: { errors: record.errors.full_messages }, status: :unprocessable_entity
      end
    end
end
