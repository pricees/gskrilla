# We use Yahoo! Finance's API.
#
# Thanks Yahoo!
#
# And thanks to this guy:
#   http://greenido.wordpress.com/2009/12/22/yahoo-finance-hidden-api/
class Summary

  attr_accessor :symbol
  attr_writer   :formats

  def formats
    @formats ||= ["Ask Price",
      "Average Daily Volume",
      "One yr Target Price",
      "Dividend Yield",
      "Price EPS Estimate Current Year",
      "Price EPS Estimate Next Year",
      "Float Shares",
      "Percent Change From 52wk High",]
  end

  def initialize(symbol)
    @symbol = symbol
    summary
  end

  def summary
    @summary ||= begin
      data = Net::HTTP.get_response(URI(uri)).body
      Hash[formats.zip(CSV.parse(data).first)]
    end
  end

  def float_shares; summary["Float Shares"].to_f end
  def ask_price; summary["Ask Price"].to_f end
  def average_daily_volume; summary["Average Daily Volume"].to_f end
  def one_yr_target_price; summary["One yr Target Price"].to_f end
  def dividend_yield; summary["Dividend Yield"].to_f end
  def price_eps_estimate_current_year; summary["Price EPS Estimate Current Year"].to_f end
  def price_eps_estimate_next_year; summary["Price EPS Estimate Next Year"].to_f end
  def percent_change_from_52wk_high; summary["Percent Change From 52wk High"].to_f end

  # NOTE: Total for now, for past shares amounts see key ratios
  def total_common_shares_outstanding
    float_shares
  end

  def price
    ask_price
  end

  private

  def uri
    f   =  OPTIONS.values_at(*formats).compact.join("")
    res =  "http://download.finance.yahoo.com/d/quotes.csv?"
    res << "s=#{symbol}&f=#{f}"
  end
end

OPTIONS = {
  "a" => "Ask Price",
  "a2" => "Average Daily Volume",
  "a5" => "Ask Size",
  "b" => "Bid",
  "b2" => "Ask (Real-time)",
  "b3" => "Bid (Real-time)",
  "b4" => "Book Value",
  "b6" => "Bid Size",
  "c" => "Change &amp; Percent Change",
  "c1" => "Change",
  "c3" => "Commission",
  "c6" => "Change (Real-time)",
  "c8" => "After Hours Change (Real-time)",
  "d" => "Dividend/Share",
  "d1" => "Last Trade Date",
  "d2" => "Trade Date",
  "e" => "Earnings/Share",
  "e1" => "Error Indication (returned for symbol changed / invalid)",
  "e7" => "EPS Estimate Current Year",
  "e8" => "EPS Estimate Next Year",
  "e9" => "EPS Estimate Next Quarter",
  "f6" => "Float Shares",
  "g" => "Day Low",
  "h" => "Day High",
  "j" => "52-week Low",
  "k" => "52-week High",
  "g1" => "Holdings Gain Percent",
  "g3" => "Annualized Gain",
  "g4" => "Holdings Gain",
  "g5" => "Holdings Gain Percent (Real-time)",
  "g6" => "Holdings Gain (Real-time)",
  "i" => "More Info",
  "i5" => "Order Book (Real-time)",
  "j1" => "Market Capitalization",
  "j3" => "Market Cap (Real-time)",
  "j4" => "EBITDA",
  "j5" => "Change From 52-week Low",
  "j6" => "Percent Change From 52-week Low",
  "k1" => "Last Trade (Real-time) With Time",
  "k2" => "Change Percent (Real-time)",
  "k3" => "Last Trade Size",
  "k4" => "Change From 52-week High",
  "k5" => "Percent Change From 52wk High",
  "l" => "Last Trade (With Time)",
  "l1" => "Last Trade (Price Only)",
  "l2" => "High Limit",
  "l3" => "Low Limit",
  "m" => "Day s Range",
  "m2" => "Day Range (Real-time)",
  "m3" => "50-day Moving Average",
  "m4" => "200-day Moving Average",
  "m5" => "Change From 200-day Moving Average",
  "m6" => "Percent Change From 200-day Moving Average",
  "m7" => "Change From 50-day Moving Average",
  "m8" => "Percent Change From 50-day Moving Average",
  "n" => "Name",
  "n4" => "Notes",
  "o" => "Open",
  "p" => "Previous Close",
  "p1" => "Price Paid",
  "p2" => "Change in Percent",
  "p5" => "Price/Sales",
  "p6" => "Price/Book",
  "q" => "Ex-Dividend Date",
  "r" => "P/E Ratio",
  "r1" => "Dividend Pay Date",
  "r2" => "P/E Ratio (Real-time)",
  "r5" => "PEG Ratio",
  "r6" => "Price EPS Estimate Current Year",
  "r7" => "Price EPS Estimate Next Year",
  "s" => "Symbol",
  "s1" => "Shares Owned",
  "s7" => "Short Ratio",
  "t1" => "Last Trade Time",
  "t6" => "Trade Links",
  "t7" => "Ticker Trend",
  "t8" => "One yr Target Price",
  "v" => "Volume",
  "v1" => "Holdings Value",
  "v7" => "Holdings Value (Real-time)",
  "w" => "52-week Range",
  "w1" => "Day&#8217;s Value Change",
  "w4" => "Day&#8217;s Value Change (Real-time)",
  "x" => "Stock Exchange",
  "y" => "Dividend Yield",
}.invert

