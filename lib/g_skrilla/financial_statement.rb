module GSkrilla
  class FinancialStatement

    def initialize(raw_data, col_count)
      hashify!(raw_data, col_count)
    end

    def data
      @data ||= {}
    end

    def method_lookup
      @method_lookup ||= {}
    end

    def hashify!(raw_data, col_count)
      raw_data.each_slice(col_count) do |row|
        label = row.shift
        title = label.downcase.gsub(/[^a-z]/, " ").gsub(/\s+/, "_")
        row.map! { |val| val.eql?("-") ? nil : val.gsub(/[^0-9\.]/, '').to_f }

        data[title]          ||= row
        method_lookup[title] ||= label
      end
    end
  end
end
