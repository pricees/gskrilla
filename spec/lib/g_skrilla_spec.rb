require_relative "../../lib/g_skrilla.rb"

describe GSkrilla, "#build" do
  it "builds a base object" do
    expect(GSkrilla::build("aapl").class).to eq(GSkrilla::Base)
  end
end
