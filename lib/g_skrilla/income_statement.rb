module GSkrilla
  class IncomeStatement < FinancialStatement

    def initialize(raw_data, type = :qtr)
      col_count = type.eql?(:qtr) ? 6 : 5
      super(raw_data, col_count)
    end
  end
end
