require_relative "../spec_helper.rb"
require_relative "../../lib/m_skrilla.rb"

describe MSkrilla do
  before do
    summary_data = 7.times.map { rand(100).fdiv(100) }.to_csv
    Net::HTTP.stub_chain(:get_response, :body).and_return summary_data
  end

  describe "#build" do
    let(:m_skrilla) { MSkrilla::build("aapl") }

    it "builds an object" do
      expect(m_skrilla.raw_data).to be_any
    end
  end
end
