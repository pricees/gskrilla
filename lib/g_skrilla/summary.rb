module GSkrilla
  class Summary
    URL = "https://www.google.com/finance?q="

    attr_reader :doc, :data, :base, :file, :symbol

    def initialize(symbol, base)
      @symbo = symbol
      @base = base
      @file = "#{base.file}.summary" if base.file
      @doc = Nokogiri::HTML(stream)
      set_vals
    end

    def stream
      @stream ||= file ? File.read(file) : open("#{URL}#{symbol}")
    end

    def set_vals
      keys   = doc.css(".key").map { |k| k.text.chomp }
      values = doc.css(".val").map { |k| k.text.chomp }
      @data = Hash[keys.zip(values)]
    end

    def pe
      @pe ||= data["P/E"].to_f
    end

    def price
      attrs = doc.xpath("//meta[@itemprop='price']").first.attributes
      attrs["content"].value.to_f
    rescue 
      0
    end

    def eps
      @eps ||= data["EPS"].to_f
    end
  end
end
