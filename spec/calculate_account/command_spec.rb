require 'spec_helper'

describe CalculateAccount::Command do

  describe "#run" do
    let(:accounts_file)     { "spec/fixtures/accounts.csv" }
    let(:transactions_file) { "spec/fixtures/transactions.csv" }
    let(:report)            { File.read("spec/fixtures/report.csv") }

    subject { described_class.new.run(accounts_file, transactions_file) }

    it "calculates" do
      expect(subject).to eql report
    end
  end

end
