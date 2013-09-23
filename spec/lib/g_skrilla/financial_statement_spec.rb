require_relative "../../../lib/g_skrilla.rb"

describe GSkrilla::FinancialStatement do
  let(:ary) do 
    ["In Millions of USD (except for per share items)", "13 weeks ending 2013-06-29", "13 weeks ending 2013-03-30", "13 weeks ending 2012-12-29", "13 weeks ending 2012-09-29", "13 weeks ending 2012-06-30", "Revenue", "35,323.00", "43,603.00", "54,512.00", "35,966.00", "35,023.00", "Other Revenue, Total", "-", "-", "-", "-", "-", "Total Revenue", "35,323.00", "43,603.00", "54,512.00", "35,966.00", "35,023.00", "Cost of Revenue, Total", "22,299.00", "27,254.00", "33,452.00", "21,565.00", "20,029.00", "Gross Profit", "13,024.00", "16,349.00", "21,060.00", "14,401.00", "14,994.00", "Selling/General/Admin. Expenses, Total", "2,890.00", "2,911.00", "2,840.00", "2,551.00", "2,545.00", "Research & Development", "933.00", "880.00", "1,010.00", "906.00", "876.00", "Depreciation/Amortization", "-", "-", "-", "-", "-", "Interest Expense(Income) - Net Operating", "-", "-", "-", "-", "-", "Unusual Expense (Income)", "-", "-", "-", "-", "-", "Other Operating Expenses, Total", "-", "-", "-", "-", "-", "Total Operating Expense", "26,122.00", "31,045.00", "37,302.00", "25,022.00", "23,450.00", "Operating Income", "9,201.00", "12,558.00", "17,210.00", "10,944.00", "11,573.00", "Interest Income(Expense), Net Non-Operating", "-", "-", "-", "-", "-", "Gain (Loss) on Sale of Assets", "-", "-", "-", "-", "-", "Other, Net", "-98.00", "-", "41.00", "-51.00", "288.00", "Income Before Tax", "9,435.00", "12,905.00", "17,672.00", "10,893.00", "11,861.00", "Income After Tax", "6,900.00", "9,547.00", "13,078.00", "8,223.00", "8,824.00", "Minority Interest", "-", "-", "-", "-", "-", "Equity In Affiliates", "-", "-", "-", "-", "-", "Net Income Before Extra. Items", "6,900.00", "9,547.00", "13,078.00", "8,223.00", "8,824.00", "Accounting Change", "-", "-", "-", "-", "-", "Discontinued Operations", "-", "-", "-", "-", "-", "Extraordinary Item", "-", "-", "-", "-", "-", "Net Income", "6,900.00", "9,547.00", "13,078.00", "8,223.00", "8,824.00", "Preferred Dividends", "-", "-", "-", "-", "-", "Income Available to Common Excl. Extra Items", "6,900.00", "9,547.00", "13,078.00", "8,223.00", "8,824.00", "Income Available to Common Incl. Extra Items", "6,900.00", "9,547.00", "13,078.00", "8,223.00", "8,824.00", "Basic Weighted Average Shares", "-", "-", "-", "-", "-", "Basic EPS Excluding Extraordinary Items", "-", "-", "-", "-", "-", "Basic EPS Including Extraordinary Items", "-", "-", "-", "-", "-", "Dilution Adjustment", "0.00", "-", "-", "-", "-", "Diluted Weighted Average Shares", "924.26", "946.03", "947.22", "948.19", "947.06", "Diluted EPS Excluding Extraordinary Items", "7.47", "10.09", "13.81", "8.67", "9.32", "Diluted EPS Including Extraordinary Items", "-", "-", "-", "-", "-", "Dividends per Share - Common Stock Primary Issue", "3.05", "2.65", "2.65", "2.65", "0.00", "Gross Dividends - Common Stock", "-", "-", "-", "-", "-", "Net Income after Stock Based Comp. Expense", "-", "-", "-", "-", "-", "Basic EPS after Stock Based Comp. Expense", "-", "-", "-", "-", "-", "Diluted EPS after Stock Based Comp. Expense", "-", "-", "-", "-", "-", "Depreciation, Supplemental", "-", "-", "-", "-", "-", "Total Special Items", "-", "-", "-", "-", "-", "Normalized Income Before Taxes", "-", "-", "-", "-", "-", "Effect of Special Items on Income Taxes", "-", "-", "-", "-", "-", "Income Taxes Ex. Impact of Special Items", "-", "-", "-", "-", "-", "Normalized Income After Taxes", "-", "-", "-", "-", "-", "Normalized Income Avail to Common", "-", "-", "-", "-", "-", "Basic Normalized EPS", "-", "-", "-", "-", "-", "Diluted Normalized EPS", "7.47", "10.09", "13.81", "8.67", "9.32"]
  end

  describe "#initalize" do
    let(:financial_statement) { GSkrilla::FinancialStatement.new(ary, 6) }

    it "has dividends_per_share_common_stock_primary_issue" do
      res = financial_statement.dividends_per_share_common_stock_primary_issue
      expect(res.length).to eq(5)
    end

    context "when calling a method for data without values" do
      it "has nil values" do
        res = financial_statement.normalized_income_before_taxes
        expect(res).to eq([nil, nil, nil, nil, nil])
      end
    end

    context "when calling a method for present financial data" do
      let(:operating_income) { financial_statement.operating_income }

      it "has 5 values" do
        expect(operating_income.length).to eq(5)
      end

      it "has float values" do
        expect(operating_income.all? { |x| x.is_a?Float }).to be_true
      end
    end
  end
end
