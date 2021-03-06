module GSkrilla
  class Base
    URL = "https://www.google.com/finance?fstype=ii&q="

    attr_reader :doc, :income_statements, :cash_flows, 
      :balance_sheets, :summary, :symbol, :file

    def income_statements
      @income_statements ||= {}
    end

    def cash_flows
      @cash_flows ||= {}
    end

    def balance_sheets
      @balance_sheets ||= {}
    end

    def initialize(symbol, file = nil)
      @symbol = symbol
      @file   = file
      @doc    = Nokogiri::HTML(stream)
      set_statements
    end

    def stream
      @stream ||= file ? File.read(file) : open("#{URL}#{symbol}")
    end

    private 

    def set_statements
      @summary = Summary.new(symbol, self)
      income_statements["qtr"] = IncomeStatement.new(to_ary[0], :qtr)
      income_statements["yr"]  = IncomeStatement.new(to_ary[1], :yr)

      balance_sheets["qtr"]    = BalanceSheet.new(to_ary[2], :qtr)
      balance_sheets["yr"]     = BalanceSheet.new(to_ary[3], :yr)

      cash_flows["qtr"]        = CashFlow.new(to_ary[4])
      cash_flows["yr"]         = CashFlow.new(to_ary[5])

      income_statements.class.send(:include, HashExt)
      cash_flows.class.send(:include, HashExt)
      balance_sheets.class.send(:include, HashExt)
    end

    def to_ary
      @to_ary ||= doc.css("table.gf-table").map do |table|
        table.children.text.split(/\n/).delete_if { |cell| cell.empty? }
      end
    end
  end
end
