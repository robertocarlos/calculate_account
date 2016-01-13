require 'spec_helper'

describe CalculateAccount::Account do
  let(:account_id) { 1 }

  subject { described_class.new(account_id, balance) }

  describe "#execute!" do
    before { subject.execute!(CalculateAccount::Transaction.new(account_id, amount)) }

    context "when debiting" do
      let(:amount) { -700 }

      context "and final balance is positive" do
        let(:balance) { (-1 * amount) + 100 }

        it "returns balance without fine" do
          expect(subject.balance).to eql(balance + amount)
        end
      end

      context "and final balance is negative" do
        let(:balance) { (-1 * amount) - 100 }

        it "returns balance plus the fine" do
          expect(subject.balance).to eql(balance + amount + described_class::FINE)
        end
      end
    end

    context "when depositing" do
      let(:amount) { 700 }

      context "and final balance is positive" do
        let(:balance) { (-1 * amount) + 100 }

        it "returns balance without fine" do
          expect(subject.balance).to eql(balance + amount)
        end
      end

      context "and final balance is negative" do
        let(:balance) { (-1 * amount) - 100 }

        it "returns balance plus the fine" do
          expect(subject.balance).to eql(balance + amount + described_class::FINE)
        end
      end
    end
  end
end
