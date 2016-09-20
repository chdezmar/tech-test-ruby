class Parser

  attr_reader :output

  def initialize
    @array = []
    @output = {}
  end

  def run(input)
    lines_to_array(input)
    numbers_to_i_and_strings_to_sym
    plateau_hash
    rovers_hash
    output
  end

  private

  def lines_to_array(input)
    input.each_line {|line| @array.push(line.gsub(/\s+/, ""))}
  end

  def numbers_to_i_and_strings_to_sym
    @array = @array.each.map {|a| a.chars.to_a.each.map {|b| b[/^-?\d+$/] ? b.to_i : b.to_sym}}
  end

  def plateau_hash
    @output[:plateau] = @array.shift
  end

  def rovers_hash
    pairs = @array.each_slice(2).to_a
    @output[:rover] = pairs
  end

end
