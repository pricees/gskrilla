module MSkrilla
  class Base

    attr_reader :raw_data, :symbol
    attr_reader :key_ratios, :summary

    def income_statements
      @income_statements ||= {}
    end

    def cash_flows
      @cash_flows ||= {}
    end

    def balance_sheets
      @balance_sheets ||= {}
    end

    def initialize(symbol)
      @symbol = symbol
      load_statements
    end

    private

    def clean_data(arr_of_arrs, min_els = 1)
      arr_of_arrs.select { |arr| arr.size > min_els }
    end

    def read_file(type, freq)
      file = "#{ENV["data_dir"]}/#{symbol}_#{type}.#{freq}.csv"
      @raw_data = CSV.read(file)
    rescue
      @raw_data = File.readlines(file).map { |line| line.chomp.split(/,/) }
    end

    def load_statements
      @key_ratios = KeyRatios.new clean_data(read_file(:key_ratios, :all))
      @summary    = Summary.new(symbol)

      @income_statements = {
        "qtr" => IncomeStatement.new(clean_data(read_file(:income_statement, :qtr))),
        "yr"  => IncomeStatement.new(clean_data(read_file(:income_statement, :yr))),
      }

      @balance_sheets = {
        "qtr" => BalanceSheet.new(clean_data(read_file(:balance_sheet, :qtr))),
        "yr"  => BalanceSheet.new(clean_data(read_file(:balance_sheet, :yr))),
      }

      @cash_flows = {
        "qtr" => Document.new(clean_data(read_file(:cash_flow, :qtr))),
        "yr"  => Document.new(clean_data(read_file(:cash_flow, :yr))),
      }
    end
  end
end
