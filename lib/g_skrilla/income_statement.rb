module GSkrilla
  class IncomeStatement < FinancialStatement

    attr_reader :data
    def initialize(ary)
      @data = ary
    end

    def parse(ary)
    end
  end
end
