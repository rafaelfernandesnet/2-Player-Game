require "./player"

@corr_answer
@input_int

def generate_random_questions
  num_1 = rand(1..20)
  num_2 = rand(1..20)
  @corr_answer = num_1 + num_2
  "What does #{num_1} plus #{num_2} equal?"
end

def check_ans
  @input_int = gets.chomp.to_i
  @input_int == @corr_answer
end

def main_loop
  player_1 = Player.new
  player_1.name = "Player 1"
  player_2 = Player.new
  player_2.name = "Player 2"
  players = [player_1, player_2]

  if_finish = false
  while true do
    players.each do |player|
      puts "********************************************"
      puts "#{player.name}! #{generate_random_questions}"

      if check_ans
        player.gain_point
      else
        player.lose_life
      end

      puts "#{player_1.name}'s point: #{player_1.point}"
      puts "#{player_2.name}'s point: #{player_2.point}"
    
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