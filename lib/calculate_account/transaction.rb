class CalculateAccount::Transaction
  attr_reader :account_id, :amount

  def initialize(account_id, amount)
    @account_id = account_id.to_i
    @amount     = amount.to_i
    @pending    = true
  end

  def pending?
    @pending
  end

  def executed?
    !pending?
  end

  def executed!
    @pending = false
  end
end
