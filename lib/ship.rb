class Ship

  attr_reader :position
  attr_reader :direction
  attr_reader :size
  attr_reader :hits

  def initialize(position, direction = :N, size = 1, hits = 0)
    @direction = direction
    @position = position
    @size = size
    @hits = hits
  end

  def was_hit
    @hits += 1
    sunk
  end

  def sunk
    if @hits == @size
      'sunk'

    else
      p @size
      p @hits
      'hit'
    end
  end

  def afloat?
    if @hits < @size
      true
    else
      false
    end
  end

end
