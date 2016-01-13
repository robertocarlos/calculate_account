class CalculateAccount::Report
  def initialize(accounts=[])
    @accounts = accounts
  end


  def to_csv 
    report = []

    @accounts.each do |account_id, account|
      report << [account.id, account.balance].join(";")
    end

    report.join("\n")
  end
end
