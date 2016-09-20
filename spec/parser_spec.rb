require 'parser'

describe Parser do

  subject(:parser) {described_class.new}
  let(:input) { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }

  context 'plateau' do
    it 'parses input to desired output' do
      output = parser.run(input)
      expect(output[:plateau]).to eq([5,5])
    end
  end

  context 'rover' do
    it 'parses input to desired output' do
      output = parser.run(input)
      expect(output[:rover]).to eq([[[1, 2, :N], [:L, :M, :L, :M, :L, :M, :L, :M, :M]], [[3, 3, :E], [:M, :M, :R, :M, :M, :R, :M, :R, :R, :M]]])
    end
  end
end
