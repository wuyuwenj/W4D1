require_relative 'tic_tac_toe'
require 'byebug'
class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def children
    childs = []
    (0..2).each do |x|
      (0..2).each do |y|
        board = @board.dup
        pos = [x, y]
        if board.empty?(pos)
          board[pos] = @next_mover_mark
          mark = :o
          if @next_mover_mark == :o
            mark = :x
          end
          childs << TicTacToeNode.new(board, mark, pos) 
        end
      end
    end
    childs  
  end
  
  def losing_node?(evaluator)
    if @board.over?
      if @board.winner == evaluator || @board.winner == nil
        return false
      else
        return true
      end
    end

    if @next_mover_mark == evaluator
      return children.all? {|child| child.losing_node?(evaluator)} 
    end
    return children.any? {|child| child.losing_node?(evaluator)}
  end

  def winning_node?(evaluator)
    if @board.over?
      if @board.winner == evaluator
        return true
      else
        return false
      end
    end

    if @next_mover_mark == evaluator
      return children.any? {|child| child.winning_node?(evaluator)} 
    else
      return children.all? {|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.

end

