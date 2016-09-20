require 'nasa_controller'
require 'rover'
require 'parser'
require 'plateau'

describe NASAController do

  subject(:nasacontroller) {described_class.new(input)}

  let(:input) { "5 5\n1 2 N\nLMLMLMLMM\n3 3 E\nMMRMMRMRRM" }
  let(:impossible_input) { "5 5\n1 2 N\nMMMMM\n3 3 E\nMMRMMRMRRM" }
  let(:impossible_negative) { "5 5\n1 2 W\nMMM\n3 3 E\nMMRMMRMRRM" }
  let(:desired_output) { "1 3 N\n5 1 E\n" }
  let(:parsed_message) { {:plateau=>[5, 5], :rover=>[[[1, 2, :N],
    [:L, :M, :L, :M, :L, :M, :L, :M, :M]], [[3, 3, :E], [:M, :M, :R, :M, :M, :R, :M, :R, :R, :M]]]}}



  let(:parser) {Parser.new}
  let(:rover) {instance_double(Rover.new)}
  let(:fake_file) { double("fake file") }

  before do
    allow(File).to receive(:open).with(input, "r").and_return(fake_file)
    allow(fake_file).to receive(:read).and_return(input)
  end

  context 'at initialization' do
    it 'parses message' do
      expect(nasacontroller.message).to eq(parsed_message)
    end

    it 'deploys_rovers' do
      expect(nasacontroller.rovers[0].position).to eq([1,2])
      expect(nasacontroller.rovers[0].orientation).to eq(:N)
    end

    it 'sets plateau' do
      expect(nasacontroller.plateau.width).to eq(5)
    end

  end

  context 'moving rovers' do
    it 'moves rover to desired postion' do
      expect { nasacontroller.move_rovers }.to output(desired_output).to_stdout
    end

    it 'raises exception if rover tries to go beyond the plateau' do
      allow(File).to receive(:open).with(input, "r").and_return(fake_file)
      allow(fake_file).to receive(:read).and_return(impossible_input)
      expect {nasacontroller.move_rovers}.to raise_error(NASAController::ERROR_MSG)
    end

    it 'raises exception if rover tries to go below 0,0 coordinates' do
      allow(File).to receive(:open).with(input, "r").and_return(fake_file)
      allow(fake_file).to receive(:read).and_return(impossible_negative)
      expect {nasacontroller.move_rovers}.to raise_error(NASAController::ERROR_MSG)
    end
  end
end
