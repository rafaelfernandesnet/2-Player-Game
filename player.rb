#correct answer
@corr_answer
#user answer
@input_int
#users life
@users_life = [3, 3]
#users score
@users_score = [0, 0]

def generate_random_questions
  num_1 = rand(1..20)
  num_2 = rand(1..20)
  @corr_answer = num_1 + num_2
  "What does #{num_1} plus #{num_2} equal?"
end

def check_ans(player_id)
  if @input_int == @corr_answer
    @users_score[player_id] += 5
  else
    @users_life[player_id] -= 1
  end
end

def prompt_answers(player_id)
  puts "***********************************"
  puts "Player #{player_id}: " + generate_random_questions
  @input_int = gets.chomp.to_i
end

def if_die(player_id)
  @users_life[player_id] == 0
end

def print_scores
  puts "Player 0's score: #{@users_score[0]}"
  puts "Player 1's score: #{@users_score[1]}"
end

def finish_game
  if @users_score[0] > @users_score[1]
    puts "Player 0 wins!"
  elsif @users_score[0] < @users_score[1]
    puts "Player 1 wins!"
  else
    puts "Tied!"
  end
end

def main_loop
  if_finish = false
  while true do
    2.times do |n|
      prompt_answers(n)
      check_ans(n)
      print_scores
      if if_die(n)
        finish_game
        if_finish = true
        break
      end
    end
    break if if_finish
    
  end
end

main_loop