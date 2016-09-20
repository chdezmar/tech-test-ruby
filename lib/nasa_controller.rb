require_relative 'parser'
require_relative 'plateau'
require_relative 'rover'

class NASAController

  ERROR_MSG = "Oops, rover can't go there".freeze

  attr_reader :rovers, :plateau, :message

  def initialize(message_from_NASA = './input.txt')
    @message = parse_message(message_from_NASA)
    @rovers = deploy_rovers
    @plateau = Plateau.new(@message[:plateau])
  end

  def move_rovers
    commands = message[:rover].map {|rover_data| rover_data[1]}
    commands.zip(rovers).each do |command, rover|
      rover.control(command)
      fail ERROR_MSG if rover.position[0] > @plateau.width || rover.position[1] > @plateau.width
      fail ERROR_MSG if rover.position[0] < 0 || rover.position[1] < 0
      puts rover.position.join(" ") + " " + rover.orientation.to_s
    end

  end

  private

  def deploy_rovers
    rovers = []
    @message[:rover].each do |rover_data|
      rover = Rover.new
      rover.deploy(rover_data[0])
      rovers << rover
    end
    rovers
  end

  def parse_message(message_from_NASA, parser = Parser.new)
    parser.run(File.open(message_from_NASA,'r').read)
  end

end
