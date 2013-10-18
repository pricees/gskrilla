require "csv"

module MSkrilla
  def self.build(symbol)
    Base.new symbol
  end
end

require_relative "hash_ext.rb"
require_relative "m_skrilla/base.rb"
require_relative "m_skrilla/document.rb"
