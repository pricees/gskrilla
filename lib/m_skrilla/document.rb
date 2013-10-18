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

    def hashify!(raw_data)
      raw_data.each do |row|
        label = row.shift # NOTE: nil labels => "date" rows

        if label
          title = label.downcase.gsub(/[^a-z]/, " ").gsub(/\s+/, "_")
          row.map! { |val| val.nil? ? nil : val.gsub(/[^0-9\.]/, '').to_f }
        end

        if label.nil?
          label = title = "dates"
        end

        data[label]          ||= row.reverse
        method_lookup[title.to_sym] ||= label
      end
    end

    def method_missing(meth, *args, &block)
      data[method_lookup[meth]] || super
    end
  end
end
