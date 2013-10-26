require 'nokogiri'
require 'open-uri'
require_relative "../lib/treasury_note.rb"

ENV["data_dir"] ||= File.dirname(__FILE__) + "/../financials"
