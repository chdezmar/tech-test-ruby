require 'plateau'

describe Plateau do

  subject(:plateau) { described_class.new([5,5]) }

  it 'has a width' do
    expect(plateau.width).to eq(5)
  end

  it 'has a length' do
    expect(plateau.length).to eq(5)
  end
end
