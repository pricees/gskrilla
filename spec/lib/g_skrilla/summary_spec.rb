require_relative "../../../lib/g_skrilla.rb"

describe GSkrilla::Summary do

  let(:symbol) { "aapl" }
  let(:input) { File.dirname(__FILE__) + "/../../web_data/#{symbol}_summary.html" }
  let!(:stream) { File.read(input) }

  subject do
    GSkrilla::Summary.new(symbol, double(stream: stream))
  end

  context "is initialized" do
    it "has a pe ratio" do
      expect(subject.pe).to eq(12.06)
    end

    it "has an eps ratio" do
      expect(subject.eps).to eq(40.04)
    end

    it "has a price" do
      expect(subject.price).to eq(482.75)
    end
  end
end
