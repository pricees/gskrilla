require_relative "../../lib/g_skrilla.rb"

describe GSkrilla, "#build" do
  it "builds a base object" do
    Nokogiri.stub(:HTML)
    GSkrilla::Base.stub(:new).and_return(:success)
    expect(GSkrilla::build("aapl")).to eq(:success)
  end
end
