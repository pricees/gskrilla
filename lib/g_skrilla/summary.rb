module GSkrilla
  class Summary
    URL = "https://www.google.com/finance?q="

    attr_reader :doc, :data

    def initialize(symbol)
      @doc = Nokogiri::HTML(open("#{URL}#{symbol}"))
      set_vals
    end

    def set_vals
      keys   = doc.css(".key").map { |k| k.text.chomp }
      values = doc.css(".val").map { |k| k.text.chomp }
      @data = Hash[keys.zip(values)]
    end

    def pe
      @pe ||= data["P/E"].to_f
    end

    def eps
      @eps ||= data["EPS"].to_f
    end
  end
end
