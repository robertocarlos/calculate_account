class CalculateAccount::Account
  FINE = -500

  attr_reader :id, :balance

  def initialize(id, balance)
    @id      = id.to_i
    @balance = balance.to_i
  end

  def balance
    @balance
  end

  def execute!(transaction)
    return unless transaction.account_id == @id || transaction.pending?

    @balance += transaction.amount
    transaction.executed!

    if @balance < 0.0
      apply_fine
    end
  end

  private

  def apply_fine
    @balance += FINE 
  end
end
