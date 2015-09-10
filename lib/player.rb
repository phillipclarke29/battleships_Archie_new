require_relative 'board'
require_relative 'ship'


class Player

  attr_reader :board, :ships, :hits, :misses

  def initialize
    @board  = Board.new
    @ships  = []
    @hits   = []
    @misses = []
  end

  def receive_miss(coord)
    @misses << coord
    'miss'
  end

  def receive_hit(coord)
    @hits << coord
    'hit'
  end

  def place(ship)
    ships << ship
  end

  def lost
    if @ships == @hits
      return 'Game Over - You Lose'
    else
      return 'Try again'
    end
  end

end
