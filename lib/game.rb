class Game

  attr_reader :options, :result, :player1, :player2, :score1, :score2, :the_winner
  attr_accessor :the_winner

  def initialize
    @result = {rock: 'scissors', scissors: 'paper', paper: 'rock'}
    @player1 = nil
    @player2 = nil
    @the_winner = nil
  end

  def add_player(player)
    (@player1 ? @player2 = player : @player1 = player) unless two_players?
  end

  def computer_choice
    player1.make_choice(result.keys).to_s if player1.is_a? Computer
    player2.make_choice(result.keys).to_s if player2.is_a? Computer
  end

  def winner
      return "No one!" if (player1.choice == player2.choice)
      (@result[player1.choice.to_sym] == player2.choice) ? "#{@the_winner = player1.win}" : "#{@the_winner =player2.win}"
  end

  def score
      "The final score is #{player1.score} : #{player2.score}"
  end

  def two_players?
    player1 && player2
  end

  def two_choices?
    player1.choice && player2.choice
  end

end