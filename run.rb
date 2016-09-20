require_relative 'lib/nasa_controller'

if ARGV
  controller = NASAController.new(ARGV[0])
else
  controller = NASAController.new
end

controller.move_rovers
