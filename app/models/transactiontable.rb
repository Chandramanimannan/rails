class Transactiontable < ApplicationRecord
  before_create :set_default_transactiondate

  private

  def set_default_transactiondate
    self.transactiondate = created_at.strftime("%d-%m-%Y %H:%M:%S").to_s
  end
end
