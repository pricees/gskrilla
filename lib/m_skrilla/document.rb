module MSkrilla
  class Document
    include HashExt

    attr_reader :raw_data
    def initialize(raw_data)
      @raw_data = raw_data
      hashify!(raw_data)
    end

    def data
      @data ||= {}
    end

    def method_lookup
      @method_lookup ||= {}
    end

    #
    #
    # raw_data - The raw data
    # has_ttm - CSVs from MorningStar generally has a TTM value that should be
    # popped
    #
    def hashify!(raw_data, has_ttm = true)
      raw_data.each do |row|
        label = row.shift # NOTE: nil labels => "date" rows

        if label
          title = label.downcase.gsub(/[^a-z]/, " ").gsub(/\s+/, "_")
          row.map! { |val| val.nil? ? nil : val.gsub(/[^0-9\.]/, '').to_f }
        else
          label = title = "dates"
        end

        row.pop if has_ttm

        data[label]          ||= row.reverse
        method_lookup[title.to_sym] ||= label
      end
    end

    def method_missing(meth, *args, &block)
      data[method_lookup[meth]] || super
    end

    private

    # Privete: Try to get values
    # NOTE: Instead of being "zeroed out", some values are omitted altogether,
    # like "long-term debt" for Aapl
    #
    def try(symbol)
      respond_to?(symbol) ? send(symbol) : Array.new(5, 0.0)
    end
  end
end
