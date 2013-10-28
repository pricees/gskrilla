require "csv"
require "net/http"
require "uri"


module MSkrilla
  def self.build(symbol)
    Base.new symbol
  end
end

require_relative "hash_ext.rb"
require_relative "summary.rb"
require_relative "m_skrilla/base.rb"
require_relative "m_skrilla/document.rb"
require_relative "m_skrilla/balance_sheet.rb"
require_relative "m_skrilla/key_ratios.rb"
require_relative "m_skrilla/income_statement.rb"
