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
