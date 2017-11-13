class Board
  def initialize
    @grid = Array.new(8) { Array.new(8)}
  end

  def move_piece(start_pos, end_pos)
    if self[start_pos].nil?
      raise ArgumentError.new("Invalid move. No piece exists at #{start_pos}.")
    elsif end_pos.any? { |coord| coord > 7 || coord < 0 }
      raise "Invalid move. Please enter a coordinate between 0 and 7"
    else
      self[end_pos] = self[start_pos]
      self[start_pos] = nil
    end
    self
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end
end
