WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

def initialize_board
  board = {}
  (1..9).each { |position| board[position] = " " }
  board
end

def draw_board(board)
  system 'clear'
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |     "
end

def empty_positions(board)
  board.select { |key, value| value == " " }.keys
end

def player_places_piece(board)
  begin
    puts "Choose a position (from 1 to 9) to place a piece:"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = "X"
end

def two_in_a_row(hsh, mrkr)
  if hsh.values.count(mrkr) == 2
    hsh.select{|k,v| v == ' '}.keys.first
  else
    false
  end
end

def computer_places_piece(board)
  position = empty_positions(board).sample
  board[position] ="O"
end

def check_winner(board)
  WINNING_LINES.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def all_positions_are_taken?(board)
  empty_positions(board) == []
end

board = initialize_board
draw_board(board)

begin
  player_places_piece(board)
  computer_places_piece(board) if !check_winner(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || all_positions_are_taken?(board)

if winner
  puts "#{winner} won!"
else
  puts "It's a tie"
end