require_relative "../../spec_helper.rb"
require_relative "../../../lib/m_skrilla.rb"

describe MSkrilla::Base do
  describe "#load_statements" do
    let(:key_ratios) { MSkrilla::build("aapl").key_ratios }

    it "has methods" do
      expect(key_ratios.operating_cash_flow_usd_mil).to_not be_nil
    end
  end

  describe "#income_statements" do
    let(:income_statements) { MSkrilla::build("aapl").income_statements }

    context "quarterly statement" do
      let(:qtr) { income_statements["qtr"] }

      it "has methods" do
        expect(qtr.gross_profit).to_not be_nil
      end
    end

    context "yearly statement" do
      let(:yr) { income_statements["yr"] }

      it "has methods" do
        expect(yr.gross_profit).to_not be_nil
      end
    end
  end

  describe "#cash_flows" do
    let(:cash_flows) { MSkrilla::build("aapl").cash_flows }

    context "quarterly statement" do
      let(:qtr) { cash_flows["qtr"] }

      it "has methods" do
        expect(qtr.depreciation_amortization).to_not be_nil
      end
    end

    context "yearly statement" do
      let(:yr) { cash_flows["yr"] }

      it "has methods" do
        expect(yr.common_stock_issued).to_not be_nil
      end
    end
  end

  describe "#balance_sheets" do
    let(:balance_sheets) { MSkrilla::build("aapl").balance_sheets }

    context "quarterly statement" do
      let(:qtr) { balance_sheets["qtr"] }

      it "has methods" do
        expect(qtr.accrued_liabilities).to_not be_nil
      end
    end

    context "yearly statement" do
      let(:yr) { balance_sheets["yr"] }

      it "has methods" do
        expect(yr.other_current_assets).to_not be_nil
      end
    end
  end
end

