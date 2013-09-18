require_relative "../../../lib/g_skrilla.rb"

describe GSkrilla::Base do

  let(:symbol) { "aapl" }
  let(:input) { File.dirname(__FILE__) + "/../../web_data/#{symbol}.html" }
  let(:stream) { File.open(input) }

  subject do
    GSkrilla::Base.stub(:open).and_return(stream)
    GSkrilla::Base.new(symbol)
  end

  context "is initialized" do
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

  it "returns ary" do
    expect(subject.send(:to_ary).length).to eq(6)
  end
end
