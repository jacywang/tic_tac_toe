def print_out_frame(spot_arr)
  puts " " * 5 + "|" + " " * 5 + "|" + " " * 5
  puts " " * 2+ spot_arr[0] + " " * 2 + "|" + " " * 2+ spot_arr[1] + " " * 2 + "|" + " " * 2+ spot_arr[2] + " " * 2
  puts " " * 5 + "|" + " " * 5 + "|" + " " * 5
  puts "-" * 5 + "+" + "-" * 5 + "+" + "-" * 5
  puts " " * 5 + "|" + " " * 5 + "|" + " " * 5
  puts " " * 2+ spot_arr[3] + " " * 2 + "|" + " " * 2+ spot_arr[4] + " " * 2 + "|" + " " * 2+ spot_arr[5] + " " * 2
  puts " " * 5 + "|" + " " * 5 + "|" + " " * 5
  puts "-" * 5 + "+" + "-" * 5 + "+" + "-" * 5
  puts " " * 5 + "|" + " " * 5 + "|" + " " * 5
  puts " " * 2+ spot_arr[6] + " " * 2 + "|" + " " * 2+ spot_arr[7] + " " * 2 + "|" + " " * 2+ spot_arr[8] + " " * 2
  puts " " * 5 + "|" + " " * 5 + "|" + " " * 5
end

def who_won(who, choices)
  result = false
  choices.combination(3).to_a.each do |val|
    result = (result || WINNING_SOLUTIONS.include?(val))
  end
  puts "#{who} won!" if result
  result
end


spots = [1, 2, 3, 4, 5, 6, 7, 8, 9]
WINNING_SOLUTIONS = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [2, 5, 8], 
                     [3, 6, 9], [3, 5, 7], [4, 5, 6], [7, 8, 9]]
player_choices = []
computer_choices = []

spot_arr = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
print_out_frame(spot_arr)

begin   
  begin
    puts "Choose a position (from 1 to 9) to place a piece:"
    player_choice = gets.chomp.to_i
  end until spots.include?(player_choice)

  player_choices << player_choice
  player_choices.sort!
  spots.delete(player_choice)
  spot_arr[player_choice - 1] = "×"

  if !spots.empty? && !who_won('You', player_choices) && !who_won('Computer', computer_choices)
    computer_choice = spots.sample
    computer_choices << computer_choice
    computer_choices.sort!
    spots.delete(computer_choice)
    spot_arr[computer_choice - 1] = "0"
  end

  print_out_frame(spot_arr)
end until ( who_won('You', player_choices) || who_won('Computer', computer_choices))










