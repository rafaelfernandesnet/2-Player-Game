require "./player"
require "./invalid_name_error"
require "./invalid_guess_error"

@corr_answer

def generate_random_questions
  num_1 = rand(1..20)
  num_2 = rand(1..20)
  @corr_answer = num_1 + num_2
  "What does #{num_1} plus #{num_2} equal?"
end

def check_ans(player)
  input_int = get_player_guess(player)

  if input_int == @corr_answer
    player.gain_point
  else
    player.lose_life
  end
end

def print_stats(player_1, player_2)
  puts "#{player_1.name}'s point: #{player_1.point}"
  puts "#{player_2.name}'s point: #{player_2.point}"
end

def get_player_name(id)
  while true
    begin
      puts "Player #{id}, please enter your name now!"
      player_name = gets.chomp
      raise InvalidNameError if player_name == ""
      return player_name
    rescue InvalidNameError => e
      puts e.message
      puts e.backtrace
    end
  end
end

def get_player_guess(player)
  while true
    begin
      puts "********************************************"
      puts "#{player.name}! #{generate_random_questions}"
      input_int = gets.chomp
      raise InvalidGuessError unless /\A[-+]?\d+\z/ === input_int
      return input_int.to_i
    rescue InvalidGuessError => e
      print e.message
      print e.backtrace
    end
  end
end

def main_loop
  player_1 = Player.new
  player_1.name = get_player_name(1)

  player_2 = Player.new
  player_2.name = get_player_name(2)
  players = [player_1, player_2]

  if_finish = false
  while true do
    players.each do |player|
      check_ans(player)

      print_stats(player_1, player_2)
    
      if(player_1.if_die || player_2.if_die)
        if_finish = true
        if player_1.point > player_2.point
          puts "Player 1 wins!"
        elsif player_1.point < player_2.point
          puts "Player 2 wins!"
        else
          puts "Ties!"
        end
        if_finish = true
        break
      end
    end

    break if if_finish
    
  end
end

main_loop