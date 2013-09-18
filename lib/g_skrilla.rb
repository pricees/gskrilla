require "g_skrilla/version"
require "open-uri"
require 'mechanize'

module GSkrilla
  extend self

  URL = "https://www.google.com/finance?fstype=ii&q="

  def grab(symbol)
    @doc = Nokogiri::HTML(open("#{URL}#{symbol}"))
  end

  def table_data(symbol)
    grab(symbol).css("table.gf-table").map do |table|
      table.children.text.split(/\n/).delete_if { |cell| cell.empty? }
    end
  end
end
