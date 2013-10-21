require_relative "../../lib/m_skrilla.rb"

describe "Summary" do

  subject { Summary.new("aapl") }

  it "has a summary" do
    expect(subject.summary).to_not be_nil
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

  describe "#percent_change_from_52wk_high" do
    it "returns a value" do
      expect(subject.percent_change_from_52wk_high).to_not be_zero
    end
  end
end
