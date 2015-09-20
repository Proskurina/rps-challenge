class Player

  attr_reader :name, :score, :id
  attr_accessor :choice

  def initialize(id = 0, name)
    @id = id
    @name = name
    @score = 0
  end

  def win
    @score +=1
    name
  end

end