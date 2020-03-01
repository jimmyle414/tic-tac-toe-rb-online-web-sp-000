WIN_COMBINATIONS = [
[0, 1, 2], 
[3, 4, 5], 
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]]

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
puts   "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
puts   "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

 def move(board, index, current_player = "X")
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != " "
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
 input = gets.strip
 index = input_to_index(input)
 if valid_move?(board, index)
   move(board, index)
   display_board(board)
 else
   turn(board)
 end
end

def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
      end
      
  end
  counter
end

def current_player(board)
   turn_count(board).even? ? "X" : "O"
  end
  
def won?(board)
WIN_COMBINATIONS.detect do |win_combination|
  location1 = win_combination[0]
  location2 = win_combination[1]
  location3 = win_combination[2]
  board[location1] == board[location2] && board[location2] == board[location3] && board[location1] != " "
end
end

def full?(board)
  board.none? {|position| position == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    winning_location = win_combination[0]
    board[winning_location]
  end
end
  

