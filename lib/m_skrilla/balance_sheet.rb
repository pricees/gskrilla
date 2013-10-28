module MSkrilla
  class BalanceSheet < Document

    # Aliases
    def total_equity
      try :total_stockholders_equity
    end

    def total_debt
      try :long_term_debt
    end

    def hashify!(raw_data, has_ttm = false)
      super raw_data, has_ttm
    end
  end
end
