require_relative "../../lib/g_skrilla.rb"

describe GSkrilla, "::grab" do

  let(:symbol) { "OUTR" }

  it "returns tables" do
    expect(GSkrilla.table_data(symbol).length).to eq(6)
  end
end

