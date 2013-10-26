require_relative "../../lib/m_skrilla.rb"

describe "Summary" do

  subject do 
    summary_data = 7.times.map { rand(100).fdiv(100) }.to_csv
    Net::HTTP.stub_chain(:get_response, :body).and_return summary_data
    Summary.new("aapl") 
  end


  describe "#ask_price" do
    it "returns a value" do
      expect(subject.ask_price).to_not be_zero
    end
  end

  describe "#average_daily_volume" do
    it "returns a value" do
      expect(subject.average_daily_volume).to_not be_zero
    end
  end

  describe "#summary" do
    it "returns a value" do
      expect(subject.summary).to be_any
    end
  end

  describe "#ask_price" do
    it "returns a value" do
      expect(subject.ask_price).to_not be_zero
    end
  end

  describe "#percent_change_from_52wk_high" do
    it "returns a value" do
      expect(subject.percent_change_from_52wk_high).to_not be_nil
    end
  end
end
