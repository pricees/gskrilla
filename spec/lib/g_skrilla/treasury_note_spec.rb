require "spec_helper"

describe TreasuryNote do 
  let(:data) do
    <<-EOXML
<feed
xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices"
xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata">
<m:properties>
  <d:BC_1YEAR m:type="Edm.Double">0.11</d:BC_1YEAR>
  <d:BC_2YEAR m:type="Edm.Double">0.32</d:BC_2YEAR>
  <d:BC_3YEAR m:type="Edm.Double">0.59</d:BC_3YEAR>
  <d:BC_5YEAR m:type="Edm.Double">1.3</d:BC_5YEAR>
  <d:BC_7YEAR m:type="Edm.Double">1.9</d:BC_7YEAR>
  <d:BC_10YEAR m:type="Edm.Double">2.53</d:BC_10YEAR>
  <d:BC_20YEAR m:type="Edm.Double">3.3</d:BC_20YEAR>
  <d:BC_30YEAR m:type="Edm.Double">3.6</d:BC_30YEAR>
  <d:BC_30YEARDISPLAY m:type="Edm.Double">3.6</d:BC_30YEARDISPLAY>
</m:properties>
    EOXML
  end

  before do
    TreasuryNote.any_instance.stub(:open).and_return(data)
  end

  describe "#doc" do
    it "docs data" do
      expect(subject.doc).to_not be_nil
    end
  end

  describe "#one_year_rate" do
    it "returns a value" do
      expect(subject.one_year_rate).to_not be_nil
    end
  end

  describe "#five_year_rate" do
    it "returns a value" do
      expect(subject.five_year_rate).to_not be_nil
    end
  end

  describe "#ten_year_rate" do
    it "returns a value" do
      expect(subject.ten_year_rate).to_not be_nil
    end
  end

  describe "#twenty_year_rate" do
    it "returns a value" do
      expect(subject.twenty_year_rate).to_not be_nil
    end
  end
end
