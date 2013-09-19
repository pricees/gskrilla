module GSkrilla
  class FinancialStatement

    attr_reader :data
    def initialize(data)
      @data = data
      parse
    end

    def parse
      data.each_slice(6) do |row|
        title = row.shift.downcase.gsub(/[^a-z]/, " ").gsub(/\s+/, "_")
        row.map! { |val| val.eql?("-") ? nil : val.to_f }
        self.class.send(:define_method, title.to_sym, lambda { row })
      end
    end
  end
end
