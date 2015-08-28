class Player
  attr_accessor :name
  attr_reader :life, :point

  def initialize
    @life = 3
    @point = 0
  end

  def gain_point
    @point += 5
  end

  def lose_life
    @life -= 1
  end

  def if_die
    @life == 0
  end

end