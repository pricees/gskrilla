require "open-uri"
require "nokogiri"
require "csv"
require "net/http"
require "uri"

module GSkrilla
  def self.build(symbol)
    Base.new(symbol)
  end
end

require_relative "g_skrilla/version"
require_relative "g_skrilla/base.rb"
require_relative "g_skrilla/financial_statement.rb"
require_relative "g_skrilla/income_statement.rb"
require_relative "g_skrilla/cash_flow.rb"
require_relative "g_skrilla/balance_sheet.rb"
require_relative "hash_ext.rb"
require_relative "summary.rb"
require_relative "g_skrilla/summary.rb"
require_relative "m_skrilla.rb"
