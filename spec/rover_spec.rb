require 'rover'


describe Rover do

  subject(:rover) { described_class.new }
  let(:rover_2) {described_class.new}


  before do
    rover.deploy([1,2,:N])
    rover_2.deploy([3,3,:E])
  end

  context 'set up' do
    it 'sets position' do
      expect(rover.position).to eq([1,2])
    end

    it 'sets orientation' do
      expect(rover.orientation).to eq(:N)
    end
  end

  context 'spinning' do
    it 'spins left' do
      rover.turn_left
      expect(rover.orientation).to eq(:W)
    end

    it 'spins left 360 degrees' do
      4.times {rover.turn_left}
      expect(rover.orientation).to eq(:N)
    end

    it 'spins left 5 times' do
      5.times {rover.turn_left}
      expect(rover.orientation).to eq(:W)
    end

    it 'spins right' do
      rover.turn_right
      expect(rover.orientation).to eq(:E)
    end

    it 'spins right 360 degrees' do
      4.times {rover.turn_right}
      expect(rover.orientation).to eq(:N)
    end

    it 'spins left 5 times' do
      5.times {rover.turn_right}
      expect(rover.orientation).to eq(:E)
    end
  end

  context 'moving' do
    it 'moves north when facing north' do
      rover.move
      expect(rover.position).to eq([1,3])
    end

    it 'moves west when facing west' do
      rover.turn_left
      rover.move
      expect(rover.position).to eq([0,2])
    end

    it 'moves south when facing south' do
      2.times {rover.turn_left}
      rover.move
      expect(rover.position).to eq([1,1])
    end

    it 'moves east when facing east' do
      rover.turn_right
      rover.move
      expect(rover.position).to eq([2,2])
    end

  end

  context 'control' do
    it 'returns correct position output after moving' do
      rover.control([:L, :M, :L, :M, :L, :M, :L, :M, :M])
      expect(rover.position).to eq([1,3])
    end

    it 'returns correct orientation output after moving' do
      rover.control([:L, :M, :L, :M, :L, :M, :L, :M, :M])
      expect(rover.orientation).to eq(:N)
    end


    it 'returns correct position output after moving' do
      rover_2.control([:M, :M, :R, :M, :M, :R, :M, :R, :R, :M])
      expect(rover_2.position).to eq([5,1])
    end


    it 'returns correct orientation output after moving' do
      rover_2.control([:M, :M, :R, :M, :M, :R, :M, :R, :R, :M])
      expect(rover_2.orientation).to eq(:E)
    end
  end
end
