require_relative "../../../lib/g_skrilla/income_statement.rb"

describe GSkrilla, "#new" do
  it "takes a symbole" do
    assert GSkrilla::IncomeStatement.new("aapl")
  end
end
