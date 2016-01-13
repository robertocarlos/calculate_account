require 'spec_helper'

describe CalculateAccount::Transaction do
  let(:account_id) { 1 }
  let(:amount)     { 10.0 }

  subject { described_class.new(account_id, amount) }

  describe "#pending" do
    context "transaction was not executed yet" do
      it "returns pending" do
        expect(subject).to be_pending
      end
    end

    context "transaction already was executed" do
      it "returns not pending" do
        subject.executed!

        expect(subject).not_to be_pending
      end
    end
  end

  it "#executed!" do
    expect{ subject.executed! }.to change{ subject.pending? }.from(true).to(false)
  end
end
