class Piece

  def initialize

  end

  def moves

  end
end

module SteppingPiece

end

class Array
  def is_valid_move?
    self.any? { |coord| coord < 0 || coord > 7 }
  end
end

module SlidingPiece
  def move_dirs(start_pos, is_horizontal_vertical, is_diagonal)
    all_moves = []
  if is_horizontal_vertical
    duped = start_pos
    until duped.any? { |coord| coord > 7 }
      all_moves << duped
      duped = [duped.first+1, duped.last]
    end

    duped = start_pos
    until duped.any? { |coord| coord < 0 }
      all_moves << duped
      duped = [duped.first-1, duped.last]
    end

    duped = start_pos
    until duped.any? { |coord| coord > 7 }
      all_moves << duped
      duped = [duped.first, duped.last+1]
    end

    duped = start_pos
    until duped.any? { |coord| coord < 0 }
      all_moves << duped
      duped = [duped.first, duped.last-1]
    end
  end

  if is_diagonal
    duped = start_pos
    until duped.any? { |coord| coord > 7 }
      all_moves << duped
      duped = [duped.first + 1, duped.last + 1]
    end

    duped = start_pos
    until duped.any? { |coord| coord > 7 || coord < 0 }
      all_moves << duped
      duped = [duped.first - 1, duped.last + 1]
    end

    duped = start_pos
    until duped.any? { |coord| coord < 0 }
      all_moves << duped
      duped = [duped.first - 1, duped.last - 1]
    end

    duped = start_pos
    until duped.any? { |coord| coord > 7 || coord < 0 }
      all_moves << duped
      duped = [duped.first + 1, duped.last - 1]
    end
  end
  all_moves.delete(start_pos)
  all_moves
  end
end

class Bishop < Piece
  include SlidingPiece

  def moves(start_pos)
    move_dirs(start_pos, is_horizontal_vertical = false, is_diagonal = true)
  end
end

class Rook < Piece
  include SlidingPiece
  def moves(start_pos)
    move_dirs(start_pos, is_horizontal_vertical = true, is_diagonal = false)
  end
end

class Queen < Piece
  include SlidingPiece
  def moves(start_pos)
    move_dirs(start_pos, is_horizontal_vertical = true, is_diagonal = true)
  end
end

class King < Piece
  def moves(start_pos)
    all_moves = []
    (-1..1).each do |shift|
      all_moves << [(start_pos.first + shift), start_pos.last + 1]
      all_moves << [(start_pos.first - shift), start_pos.last - 1]
      all_moves << [(start_pos.first + shift), start_pos.last]
    end
    all_moves.delete(start_pos)
    all_moves.reject { |move| move.is_valid_move? }
  end
end

class Knight < Piece

  def moves(start_pos)
    all_moves = []
    all_moves << [start_pos.first + 2, start_pos.last + 1]
    all_moves << [start_pos.first + 1, start_pos.last + 2]
    # all_moves.map! { |move| [move.first*-1,move.last] }
    # all_moves.map! { |move| [move.first, move.last*-1] }
    # all_moves.reject { |move| move.is_valid_move? }
  end
end
