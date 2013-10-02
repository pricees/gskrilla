require_relative "../../../lib/g_skrilla.rb"

describe GSkrilla::Base do

  let(:symbol) { "aapl" }
  let(:input) { File.dirname(__FILE__) + "/../../web_data/#{symbol}.html" }
  let(:stream) { File.open(input) }

  let(:summary) do 
    file = File.dirname(__FILE__) + "/../../web_data/#{symbol}.html"
    File.open file
  end

  subject do
    GSkrilla::Summary.any_instance.stub(:open).and_return(summary)
    GSkrilla::Base.any_instance.stub(:open).and_return(stream)
    GSkrilla::Base.new(symbol)
  end

  context "is initialized" do
    it "has a summary" do
      expect(subject.summary).to_not be_nil
    end

    it "has 2 income statements" do
      expect(subject.income_statements.length).to eq(2)
    end

    it "has 2 cash flows" do
      expect(subject.cash_flows.length).to eq(2)
    end

    it "has 2 balance sheets" do
      expect(subject.balance_sheets.length).to eq(2)
    end
  end

  context "it has income statements" do
    let(:qtr) { subject.income_statements.qtr }
    let(:yr) { subject.income_statements.yr }

    it "has a quarterly statement" do
      expect(qtr).to_not be_nil
    end

    it "has a yearly statement" do
      expect(yr).to_not be_nil
    end

    it "has different revenue" do
      expect(qtr.revenue).to_not eq(yr.revenue)
    end
  end

  context "it has cash flows" do
    let(:qtr) { subject.cash_flows.qtr }
    let(:yr) { subject.cash_flows.yr }

    it "has a quarterly statement" do
      expect(qtr).to_not be_nil
    end

    it "has a yearly statement" do
      expect(yr).to_not be_nil
    end

    it "has different 'net change in cash'" do
      expect(qtr.net_change_in_cash).to_not eq(yr.net_change_in_cash)
    end
  end

  context "it has balance sheets" do
    let(:qtr) { subject.balance_sheets.qtr }
    let(:yr) { subject.balance_sheets.yr }

    it "has a quarterly statement" do
      expect(qtr).to_not be_nil
    end

    it "has a yearly statement" do
      expect(yr).to_not be_nil
    end

    it "has different income statements" do
      expect(qtr).to_not eq(yr)
    end
  end

  it "returns ary" do
    expect(subject.send(:to_ary).length).to eq(6)
  end
end
