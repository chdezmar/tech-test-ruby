
class Rover

  ORIENTATIONS = [:N, :W, :S, :E]

  DIRECTIONS = {
    :left => 1,
    :right => -1
  }

  MOVE_MAP = {
    :N => [0, 1],
    :W => [-1, 0],
    :S => [0, -1],
    :E => [1, 0]
  }

  attr_reader :position, :orientation

  def initialize
    @position = []
    @orientation = nil
  end

  def deploy(information)
    @position = [information[0], information[1]]
    @orientation = information.last
  end

  def control(commands)
    commands.each do |command|
      case command
      when :L then turn_left
      when :R then turn_right
      else move
      end
    end
    position
  end

  def move
    @position = move_by_orientation(orientation)
  end

  def turn_left
    @orientation = spin(DIRECTIONS[:left])
  end

  def turn_right
    @orientation = spin(DIRECTIONS[:right])
  end

  private

  def move_by_orientation(orientation)
    [position, MOVE_MAP[orientation]].transpose.map {|x| x.reduce(:+)}
  end

  def spin(direction)
    ORIENTATIONS[(ORIENTATIONS.index(orientation)+direction)%ORIENTATIONS.size]
  end


end
