module GSkrilla
  class CashFlow < FinancialStatement

    COL_COUNT = 5

    def initialize(raw_data)
      super(raw_data, COL_COUNT)
    end
  end
end
