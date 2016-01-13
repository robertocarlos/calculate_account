module CalculateAccount
  class Command
    def run(accounts_file, transactions_file)
      raise "ARQUIVO INVÁLIDO" unless accounts_file && transactions_file
      
      accounts     = accounts_loader(accounts_file)
      transactions = transactions_loader(transactions_file)

      transactions.each do |transaction|
        account = accounts[transaction.account_id]
        next unless account

        account.execute!(transaction)
      end

      Report.new(accounts).to_csv
    end

    private

    def readlines_from(file)
      File.read(file).split("\n")
    end

    def accounts_loader(file)
      accounts = {}

      readlines_from(file).each do |line|
        account_id, balance = line.split(";")

        accounts[account_id.to_i] = Account.new(account_id, balance)
      end

      accounts
    end

    def transactions_loader(file)
      transactions = []

      readlines_from(file).each do |line|
        account_id, amount = line.split(";")

        transactions << Transaction.new(account_id, amount)
      end

      transactions
    end
  end
end
