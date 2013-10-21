require_relative "../spec_helper.rb"
require_relative "../../lib/m_skrilla.rb"

describe MSkrilla do
  describe "#build" do
    let(:m_skrilla) { MSkrilla::build("aapl") }

    it "builds an object" do
      expect(m_skrilla.raw_data).to be_any
    end
  end
end
