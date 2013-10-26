class TreasuryNote
  def doc
    @doc ||=begin
              link = "http://data.treasury.gov/feed.svc/"
              link << "DailyTreasuryYieldCurveRateData?"
              link << "$filter=month(NEW_DATE)%20eq%2010%20and%20year"   
              link << "(NEW_DATE)%20eq%202013"
              Nokogiri::XML(open(link)).xpath("//m:properties").last
            end
  end

  def one_year_rate
    doc.xpath("//d:BC_1YEAR").text.to_f
  end

  def five_year_rate
    doc.xpath("//d:BC_5YEAR").text.to_f
  end

  def ten_year_rate
    doc.xpath("//d:BC_10YEAR").text.to_f
  end

  def twenty_year_rate
    doc.xpath("//d:BC_20YEAR").text.to_f
  end
end
